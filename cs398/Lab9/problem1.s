# spimbot constants
ANGLE = 0xffff0014
ANGLE_CONTROL = 0xffff0018
TIMER = 0xffff001c
HEAD_X = 0xffff0020
HEAD_Y = 0xffff0024
BONK_ACKNOWLEDGE = 0xffff0060
TIMER_ACKNOWLEDGE = 0xffff006c
APPLE_X = 0xffff0070
APPLE_Y = 0xffff0074

.kdata                # interrupt handler data (separated just for readability)
chunkIH:.space 32      # space for eight registers
non_intrpt_str:   .asciiz "Non-interrupt exception\n"
unhandled_str:    .asciiz "Unhandled interrupt type\n"


.ktext 0x80000180
interrupt_handler:
.set noat
				move	$k1, $at
.set at
				la		$k0, chunkIH
				sw		$a0, 0($k0)
				sw		$a1, 4($k0)
				
				mfc0	$k0, $13
				srl		$a0, $k0, 2
				and		$a0, $k0, 0xf
				bne		$a0, 0, non_intr
				
intr_dsph:											#$a0 = 0, $v0 = 0 at this stage
				mfc0	$k0, $13					#k0 gets overwritten
				beq		$k0, $zero, done			
													
				and		$a0, $k0, 0x8000
				bne		$a0, 0, timer_intr
				
				li		$v0, 4
				la		$a0, unhandled_str
				syscall
				j		done
				
#bonk_intr:		
				



timer_intr:											#$a0 != 0 at this stage
				sw		$a1, TIMER_ACKNOWLEDGE		#$a1 gets overwritten here
				
				lw		$t0, HEAD_X
				lw		$t1, HEAD_Y					#read snake's head
				lw		$t2, APPLE_X
				lw		$t3, APPLE_Y				#read public apple
				
				beq		$t0, $t2, eqx
				bge		$t0, $t2, gex0
				li		$t0, 0
				j		wait
		gex0:	li		$t0, 180
				j		wait
	eqx:		bge		$t1, $t3, eqy1
				li		$t0, 90
				j		wait
		eqy1:	li		$t0, 270
				j		wait
				
	wait:		lw		$t1, prev_angle
				sub		$t1, $t1, $t0
				abs		$t1, $t1
				bne		$t1, 180, sett
				add		$t1, $t0, 90
				sw		$t1, ANGLE
				li		$t1, 1
				sw		$t1, ANGLE_CONTROL
				li		$t1, 5000
		loop:	beq		$t1, 0, sett
				sub		$t1, $t1, 1	
				j		loop
				
	sett:		sw		$t0, ANGLE
				li		$t1, 1
				sw		$t1, ANGLE_CONTROL
				sw		$t0, prev_angle
				
				lw		$v0, TIMER					#$v0 gets overwritten here
				add		$v0, $v0, 500
				sw		$v0, TIMER
													#What does the value of $v0 for?
				j		intr_dsph
				
non_intr:											#$a0 = 0 at this stage, a parallel unit with dsph
				li		$v0, 4						#$v0 gets overwritten here, but so far we don't mind...?
				la		$a0, non_intrpt_str
				syscall
				j		done
				
done:			
				la		$k0, chunkIH
				lw		$a0, 0($k0)
				lw		$a1, 4($k0)
.set noat
				move	$at, $k1
.set at
				eret
				
				













