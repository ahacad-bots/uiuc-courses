	

    # spimbot constants
    ANGLE = 0xffff0014
    ANGLE_CONTROL = 0xffff0018
    TIMER = 0xffff001c
    HEAD_X = 0xffff0020
    HEAD_Y = 0xffff0024
    BONK_ACKNOWLEDGE = 0xffff0060
    TIMER_ACKNOWLEDGE = 0xffff006c
    APPLE_X = 0xffff0070                            #public 0xfff0070
    APPLE_Y = 0xffff0074                            #public 0xfff0074
    OTHER_BOT_0xfff0020 = 0
    OTHER_BOT_0xfff0024 = 0
    REQUEST_PUZZLE = 0xffff0090
    SUBMIT_PUZZLE = 0xffff0094
    PIVOT_NODES_X = 0xffff00c0
    PIVOT_NODES_Y = 0xffff00c4
    
    ########################### DATA SEGMENT ##############################
    .data
    L22a0: .byte 0x5, 0x9, 0xe, 0xd
	L22c0: .byte 0xa, 0x3, 0x6, 0x9
	L22e0: .byte 0xd, 0x6, 0xf, 0xe
	L2300: .byte 0x1, 0xc, 0xe, 0xd
	L2320: .byte 0xf, 0x3, 0x1, 0xc
	L2340: .byte 0x4, 0xa, 0xd, 0x1
	L2360: .byte 0xd, 0x1, 0xf, 0xe
	L2380: .byte 0x4, 0xf, 0xd, 0x5
	L2250: .word L22a0, L22c0, L22e0, L2300, L2320, L2340, L2360, L2380
	list2: .word 8, L2250
	
    B21b0: .byte 0x0, 0x0, 0x0, 0x0
	B21d0: .byte 0x0, 0x0, 0x0, 0x0
	B21f0: .byte 0x0, 0x0, 0x0, 0x0
	B2210: .byte 0x0, 0x0, 0x0, 0x0
	B2180: .word B21b0, B21d0, B21f0, B2210
	ans: .word 4, B2180
	######################################################################
    .text
    main:                                  # ENABLE INTERRUPTS
         li     $t4, 0x8000                # timer interrupt enable bit
         or     $t4, $t4, 0x1000           # bonk interrupt bit
         or		$t4, $t4, 0x2000
         or		$t4, $t4, 0x4000
         
         or     $t4, $t4, 1                # global interrupt enable
         mtc0   $t4, $12                   # set interrupt mask (Status register)
         
                                           # REQUEST TIMER INTERRUPT
         lw     $v0, 0xffff001c($0)        # read current time
         add    $v0, $v0, 50               # add 50 to current time
         sw     $v0, 0xffff001c($0)        # request timer interrupt in 50 cycles
         
      
         
         
         

    infinite:
				la		$t0, list2
         		sw		$t0, 0xffff0090($0)		#request for the puzzle
         		
    			la      $a0, ans
        		la      $a1, list2
        		li      $a2, 0
        		li      $a3, 0
        		jal     solve	         # call solve function
	    	 	la		$t0, ans
         sw		$t0, 0xffff0094($0)
				j      infinite
         nop
     
######################################################################################################
     
    matrix_column_matches_list_row:
    li      $t0, 0          # $t0 = k = 0

mcmlr_loop_cond:
    lw      $t1, 0($a0)     # $t1 = matrix->size
    bge     $t0, $t1, mcmlr_loop_end

mcmlr_loop:
    lw      $t2, 4($a0)     # $t2 = matrix->data
    mul     $t3, $t0, 4     # $t3 = 4 * k
    add     $t2, $t2, $t3   # $t2 = &matrix->data[k]
    lw      $t2, 0($t2)     # $t2 = matrix->data[k]
    add     $t2, $t2, $a1   # $t2 = &matrix->data[k][col]
    lb      $t2, 0($t2)     # $t2 = matrix->data[k][col]

    lw      $t3, 4($a2)     # $t3 = list->data
    mul     $t4, $a3, 4     # $t4 = 4 * row
    add     $t3, $t3, $t4   # $t3 = &list->data[row]
    lw      $t3, 0($t3)     # $t3 = list->data[row]
    add     $t3, $t3, $t0   # $t3 = &list->data[row][k]
    lb      $t3, 0($t3)     # $t3 = list->data[row][k]

    beq     $t2, $t3, mcmlr_if_end

    li      $v0, 0          # return 0
    j       mcmlr_return

mcmlr_if_end:
    add     $t0, $t0, 1     # ++ k
    j       mcmlr_loop_cond

mcmlr_loop_end:
    li      $v0, 1          # return 1

mcmlr_return:
    jr      $ra


######################################################################################################

any_matrix_column_matches_list_row:
    sub     $sp, $sp, 24
    sw      $ra, 0($sp)
    sw      $a0, 4($sp)
    sw      $a1, 8($sp)
    sw      $a2, 12($sp)
    sw      $s0, 16($sp)
    sw      $s1, 20($sp)

    li      $s0, 0          # $s0 = col = 0

amcmlr_loop_cond:
    lw      $a0, 4($sp)     # $a0 = matrix
    lw      $s1, 0($a0)     # $s1 = matrix->size
    bge     $s0, $s1, amcmlr_loop_end

amcmlr_loop:
    move    $a1, $s0        # $a1 = col
    lw      $a2, 8($sp)     # $a2 = list
    lw      $a3, 12($sp)    # $a3 = row

    jal     matrix_column_matches_list_row  # matrix_column_matches_list_row(matrix, col, list, row)

    beq     $v0, 0, amcmlr_if_end

    li      $v0, 1          # return 1
    j       amcmlr_return

amcmlr_if_end:
    add     $s0, $s0, 1     # ++ col
    j       amcmlr_loop_cond

amcmlr_loop_end:
    li      $v0, 0          # return 0

amcmlr_return:
    lw      $ra, 0($sp)
    lw      $s0, 16($sp)
    lw      $s1, 20($sp)
    add     $sp, $sp, 24

    jr      $ra

######################################################################################################

check_remaining_columns:
    sub     $sp, $sp, 28
    sw      $ra, 0($sp)
    sw      $a0, 4($sp)		# save 1st two arguments
    sw      $a1, 8($sp)

    sw      $s0, 12($sp)	# save some callee-saved registers
    sw      $s1, 16($sp)
    sw      $s2, 20($sp)
    sw      $s3, 24($sp)

    li      $s0, 0          # $s0 = i = 0
    lw      $s1, 0($a1)     # $s1 = list->size
    li      $s2, 1          # $s2 = 1
    move    $s3, $a2	    # $s3 = bitmask

crc_loop:
    bge     $s0, $s1, crc_loop_end

    sll     $t0, $s2, $s0   # $t0 = 1L << i
    and     $t0, $t0, $s3   # $t0 = (1L << i) & bitmask
    bne     $t0, 0, crc_continue			

    lw      $a0, 4($sp)     # $a0 = matrix
    lw      $a1, 8($sp)     # $a1 = list
    move    $a2, $s0        # $a2 = i
    jal     any_matrix_column_matches_list_row
    beq     $v0, 0, crc_return	# if call returns zero, we return zero ($v0 is already 0)

crc_continue:
    add     $s0, $s0, 1      # ++ i
    j       crc_loop

crc_loop_end:
    li  $v0, 1              # return 1

crc_return:
    lw      $ra, 0($sp)
    lw      $s0, 12($sp)	# save some callee-saved registers
    lw      $s1, 16($sp)
    lw      $s2, 20($sp)
    lw      $s3, 24($sp)
    add     $sp, $sp, 28
    jr      $ra

######################################################################################################

solve:
    sub     $sp, $sp, 28
    sw      $ra, 0($sp)	    # save return address

    lw      $t0, 0($a0)     # matrix->size
    bne     $a2, $t0, solve_recurse

    move    $a2, $a3        # pass args (matrix, list, bitmask)
    jal     check_remaining_columns      # return value in $v0

    lw      $ra, 0($sp)
    add     $sp, $sp, 28
    jr      $ra

solve_recurse:
    sw      $s0, 4($sp)     # save a bunch of $s registers
    sw      $s1, 8($sp)
    sw      $s2, 12($sp)
    sw      $s3, 16($sp)
    sw      $s4, 20($sp)    
    sw      $s5, 24($sp)

    move    $s0, $a0       # copy arguments to $s registers
    move    $s1, $a1
    move    $s2, $a2
    move    $s3, $a3

    li      $s4, 0          # $s4 = i = 0

solve_loop:
    lw      $t0, 0($s1)     # $t0 = list->size
    bge     $s4, $t0, solve_return0

    li      $t0, 1          # 1
    sll     $t0, $t0, $s4   # $t0 = (1 << i)
    and     $t1, $t0, $s3   # $t1 = (1L << i) & bitmask
    bne     $t1, 0, solve_continue

    li      $s5, 0          # $s4 = j = 0

solve_inner_loop:
    lw      $t2, 0($s0)     # $t2 = matrix->size
    bge     $s5, $t2, solve_inner_done

    lw      $t3, 4($s0)     # $t3 = matrix->data
    mul     $t4, $s2, 4     # $t4 = 4 * depth
    add     $t4, $t3, $t4   # $t4 = &matrix->data[depth]
    lw      $t4, 0($t4)     # $t4 = matrix->data[depth]
    add     $t4, $t4, $s5   # $t4 = &matrix->data[depth][j]

    lw      $t5, 4($s1)     # $t5 = list->data
    mul     $t6, $s4, 4     # $t6 = 4 * i
    add     $t6, $t5, $t6   # $t6 = &list->data[i]
    lw      $t6, 0($t6)     # $t6 = list->data[i]
    add     $t6, $t6, $s5   # $t6 = &list->data[i][j]
    lb      $t6, 0($t6)     # $t6 = list->data[i][j]

    sb      $t6, 0($t4)     # matrix->data[depth][j] = list->data[i][j]

    add     $s5, $s5, 1     # ++ j
    j       solve_inner_loop

solve_inner_done:
    move    $a0, $s0
    move    $a1, $s1
    add     $a2, $s2, 1     # $a2 = depth + 1
    or      $a3, $s3, $t0   # $a3 = (1L << i) | bitmask
    jal     solve           # new_solve(matrix, list, depth + 1, (1L << i) | bitmask)

    beq     $v0, 0, solve_continue

    li      $v0, 1          # return 1
    j       solve_done

solve_continue:
    add     $s4, $s4, 1     # ++ i
    j       solve_loop

solve_return0:
    li      $v0, 0          # return 0

solve_done:
    lw      $ra, 0($sp)
    lw      $s0, 4($sp)     # save a bunch of $s registers
    lw      $s1, 8($sp)
    lw      $s2, 12($sp)
    lw      $s3, 16($sp)
    lw      $s4, 20($sp)    
    lw      $s5, 24($sp)
    add     $sp, $sp, 28
    jr      $ra





 
    ########################### DATA SEGMENT ##############################
    .kdata
    chunkIH:.space 64      # space for eight registers
    non_intrpt_str:   .asciiz "Non-interrupt exception\n"
    unhandled_str:    .asciiz "Unhandled interrupt type\n"
    .globl prev_angle
    prev_angle: .word 0
    .globl prev_direction           #The previous direction
    prev_direction: .word 0
    .globl turn_counter
    .globl pivot_y
    pivot_y: .space 1024
    .globl pivot_x
    pivot_x: .space 1024
    turn_counter: .word 0
    ######################################################################
     
     
     
     
     
     
    .ktext 0x80000180
    interrupt_handler:
    .set noat
                                    move    $k1, $at
    .set at
                                    la              $k0, chunkIH
                                    sw $t0,0($k0)
        							sw $t1,4($k0)  
        							sw $t2,8($k0)  
        							sw $t3,12($k0)  
        							sw $t4,16($k0)  
        							sw $t5,20($k0)
        							sw $t6,24($k0)
        							sw $t7,28($k0)
        							sw $t8,32($k0)
        							sw $t9,36($k0)
        							sw $a0,40($k0)
                                    sw $a1,44($k0)
        							sw $a2,48($k0)
        							sw $a3,52($k0)
        							sw $v0,56($k0)
        							sw $ra,60($k0) 
                                   
                                    mfc0    $k0, $13
                                    srl             $a0, $k0, 2
                                    and             $a0, $k0, 0xf
                                    bne             $a0, 0, non_intr
                                   
    intr_dsph:                                                                                              #$a0 = 0, $v0 = 0 at this stage
                                    mfc0    		$k0, $13                                                #k0 gets overwritten
                                    beq             $k0, $zero, done  
                                    
                                    and     		$a0, $k0, 0x1000                      
                                    bne             $a0, 0, bonk_intr 
                                    
                                    and				$a0, $k0, 0x2000
                                    bne				$a0, 0, apple_intr
                                    
                                    and				$a0, $k0, 0x4000
                                    bne				$a0, 0, eaten_intr 
                                                                                                   
                                    and             $a0, $k0, 0x8000
                                    bne             $a0, 0, timer_intr
     								
     								
                                   
                                    li              $v0, 4
                                    la              $a0, unhandled_str
                                    syscall
                                    j               done
                                   
    bonk_intr:             
                                    sw				$a1, 0xffff0060($0)										#
                                    lw              $t0, 0xffff0040($0)                     				#current direction
                                    lw              $t1, prev_direction                    				 	#previous direction
                                    lw              $t2, 0xffff0014($0)
                                    lw				$t5, 0xffff0040($0)
                                    sw              $t1, 0xffff0014($0)
                                    sw              $t2, prev_angle
                                    sw              $t0, prev_direction
                                    																#A precaution for walls
                                    lw				$t1, 0xffff0020($0)								#snake's head
                                    lw				$t2, 0xffff0024($0)
                                    beq				$t1, 300, lrw
                                    beq				$t1, $0, lrw
                                    beq				$t2, 300, udw
                                    beq				$t2, $0, udw
                                    j				finish
                                    sw				$t5, prev_angle 
                            lrw:	lw				$t3, 0xffff0074($0)
                            		bge				$t3, $t2, set90
                            		li				$t1, 270
                            		j				bset				
                            set90:	li				$t1, 90
                            		j				bset
                            udw:	lw				$t3, 0xffff0070($0)
                                 	bge				$t3, $t1, set0
                            		li				$t1, 180
                            		j				bset				
                            set0:	li				$t1, 0
                         	bset:	sw				$t1, 0xffff0014($0)
									li              $t1, 1
                                    sw              $t1, 0xffff0018($0)
                            #bloop:  beq             $t1, 0, set
                            #        sub             $t1, $t1, 1    
                            #        j               bloop		
                    		finish:	j               intr_dsph
     
     
    timer_intr:                                                                                     #$a0 != 0 at this stage
                                sw              $a1, 0xffff006c($0)                             #$a1 gets overwritten here
                                lw              $t0, 0xffff0020($0)
                                lw              $t1, 0xffff0024($0)                             #read snake's head
                                lw              $t2, 0xffff0070($0)
                                lw              $t3, 0xffff0074($0)                             #read public apple
                               
                                beq             $t0, $t2, eqx
                                bge             $t0, $t2, gex0
                                li              $t0, 0
                                j               wait
                gex0:   li              $t0, 180
                                j               wait
        eqx:            bge             $t1, $t3, gey
                                li              $t0, 90
                                j               wait
                gey:    li              $t0, 270
                                j               wait
                               
        wait:           lw              $t1, prev_angle
                                sub             $t1, $t1, $t0
                                abs             $t1, $t1
                                bne             $t1, 180, sett
                                add             $t1, $t0, 90
                                sw              $t1, 0xffff0014($0)
                                li              $t1, 1
                                sw              $t1, 0xffff0018($0)
                                li              $t1, 5000
                tloop:  beq             $t1, 0, sett
                                sub             $t1, $t1, 1    
                                j               tloop
                               
        sett:           sw              $t0, 0xffff0014($0)
                                li              $t1, 1
                                sw              $t1, 0xffff0018($0)
                                sw              $t0, prev_angle
                               
                                lw              $v0, 0xffff001c($0)                                     #$v0 gets overwritten here
                                add             $v0, $v0, 500
                                sw              $v0, 0xffff001c($0)
                                                                                                        #What does the value of $v0 for?
                                j               intr_dsph
                                    
    apple_intr:						
    								sw              $a1, 0xffff006c($0)                               
    								lw				$t0, 0xffff0020($0)			#snake
    								lw				$t1, 0xffff0024($0)			
    								#lw				$t2, 0xffff0070($0)			#public_apple
    								#lw				$t3, 0xffff0074($0)
    								lw				$t4, 0xffff00b0($0)			#private_apple
    								lw				$t5, 0xffff00b4($0)
    								#sub				$t6, $t0, $t2
    								#abs				$t6, $t6
    								#sub				$t7, $t1, $t3
    								#abs				$t7, $t7
    								#add				$t6, $t7, $t6				#distance_pubSnake
    								#sub				$t7, $t0, $t4
    								#abs				$t7, $t7
    								#sub				$t8, $t1, $t5
    								#abs				$t8, $t8
    								#add				$t7, $t7, $t8				#distance_priSnake
    								#bge				$t7, $t6, a_finish
    								
    								move			$t2, $t4
    								move			$t3, $t5
                                lw              $t0, 0xffff0020($0)
                                lw              $t1, 0xffff0024($0)                             #read snake's head
                                lw              $t2, 0xffff0070($0)
                                lw              $t3, 0xffff0074($0)                             #read public apple
                               
                                beq             $t0, $t2, a_eqx
                                bge             $t0, $t2, a_gex0
                                li              $t0, 0
                                j               a_wait
                a_gex0:   		li              $t0, 180
                                j               a_wait
        a_eqx:            		bge             $t1, $t3, a_gey
                                li              $t0, 90
                                j               a_wait
                a_gey:    		li              $t0, 270
                                j               a_wait
                               
        a_wait:           		lw              $t1, prev_angle
                                sub             $t1, $t1, $t0
                                abs             $t1, $t1
                                bne             $t1, 180, sett
                                add             $t1, $t0, 90
                                sw              $t1, 0xffff0014($0)
                                li              $t1, 1
                                sw              $t1, 0xffff0018($0)
                                li              $t1, 5000
                aloop:  beq             $t1, 0, a_sett
                                sub             $t1, $t1, 1    
                                j               aloop
                               
        a_sett:           		sw              $t0, 0xffff0014($0)
                                li              $t1, 1
                                sw              $t1, 0xffff0018($0)
                                sw              $t0, prev_angle
                               
                                lw              $v0, 0xffff001c($0)                                     #$v0 gets overwritten here
                                add             $v0, $v0, 500
                                sw              $v0, 0xffff001c($0)
                                                                                                        #What does the value of $v0 for?
        a_finish:                        j               intr_dsph
    eaten_intr:						
                                   sw				$a0, 0xffff0068($0)
                                   j				intr_dsph
    non_intr:                                                                         #$a0 = 0 at this stage, a parallel unit with dsph
                                    li              $v0, 4                            #$v0 gets overwritten here, but so far we don't mind...?
                                    la              $a0, non_intrpt_str
                                    syscall
                                    j               done 
                                   
    done:                  
                                    la              $k0, chunkIH
                                    lw $t0,0($k0)
        							lw $t1,4($k0)  
        							lw $t2,8($k0)  
        							lw $t3,12($k0)  
        							lw $t4,16($k0)  
        							lw $t5,20($k0)
        							lw $t6,24($k0)
        							lw $t7,28($k0)
        							lw $t8,32($k0)
        							lw $t9,36($k0)
        							lw $a0,40($k0)
                                    lw $a1,44($k0)
        							lw $a2,48($k0)
        							lw $a3,52($k0)
        							lw $v0,56($k0)
        							lw $ra,60($k0) 
    .set noat
                                    move    $at, $k1
    .set at
                                    eret

######################################################################################################


