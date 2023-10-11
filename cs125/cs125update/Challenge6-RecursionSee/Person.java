//UIUC CS125 FALL 2013 MP. File: Person.java, CS125 Project: Challenge6-RecursionSee, Version: 2013-11-05T17:24:16-0600.569335634
/**
 * @author replace-with-your-pliu15-here
 *
 */
public class Person
{
private final String name;
private final int age;
private final char gender;
private final Person child1; //left child
private final Person child2; //right child

public Person(String name, int age, char gender, Person c1, Person c2)
{
    this.name=name;
    this.age=age;
    this.gender=gender;
    this.child1 = c1;
    this.child2 = c2;
}

public String toString()
{
    return name+"*"+age+"*"+gender;
}

public String getName() 
{
	return name;
}

public int getAge() 
{
	return age;
}

public char getGender() 
{
	return gender;
}

public boolean equals(Person p)
{
	return (this.name.equals(p.name)) &&
			(this.age==p.age) &&
			(this.gender==p.gender);
}


public void print() 
{
   System.out.println(this);
   if(child1 != null)
       child1.print();
   if(child2 != null)
       child2.print();
   
}

public int count() // total person count including this object
{
	int total = 1;
	if (child1 != null) 
		total = total + child1.count();
	if (child2 != null) 
		total = total + child2.count();
	return total;
	//YOUR CODE HERE
	//throw new IllegalArgumentException("Not Yet Implemented");
}
public int countGrandChildren() // but not greatGrandChildren
{
	int count = 0;
    Person tmp = new Person(null, 0, 'M', null, null);
    tmp = this.child1;
    if (tmp != null){
        if (tmp.child1 != null) 
        	count ++;
        if (tmp.child2 != null) 
        	count ++;
    }
    
    tmp = this.child2;
    if (tmp != null) {
        if (tmp.child2 != null) 
        	count ++;
        if (tmp.child1 != null) 
        	count ++;
    }
    return count;
//YOUR CODE HERE
	//throw new IllegalArgumentException("Not Yet Implemented");
}

public int countMaxGenerations()
{
	if ((this.child1 == null) && (this.child2 == null)) 
		return 1;
    else{
    	int Gen1 = 0;
    	int Gen2 = 0;
    if (this.child1 != null) 
    	Gen1 = child1.countMaxGenerations();
    if (this.child2 != null) 
    	Gen2 = child2.countMaxGenerations();
    if (Gen1 >= Gen2) 
    	return Gen1 + 1;
    else 
    	return Gen2 + 1;
    }//YOUR CODE HERE
	//throw new IllegalArgumentException("Not Yet Implemented");   
}

public int countGender(char gen)
{
	int count = 0;
	if (this.gender == gen) 
		count = 1;
	else 
		count = 0;
	
	if (child1 != null) 
		count = count + child1.countGender(gen);
	if (child2 != null) 
		count = count + child2.countGender(gen);
	return count;//YOUR CODE HERE
	//throw new IllegalArgumentException("Not Yet Implemented");
}

public static int powerOf(int m,int n){
	int power = 1;
	for(int i=0; i < n; i++)
		power = power * m;
	return power;
}


public Person search(String name, int maxGeneration)
{
	Person[][] tmp = new Person[maxGeneration][powerOf(2, maxGeneration)];
	tmp[0][0] = this;
	int t = 0;
	for (int i=1;i < maxGeneration; i++){
		t = -1;
		for (int j=0;j < powerOf(2, i-1); j++){
			t ++;
			if (tmp[i-1][j] == null) 
				tmp[i][t] = null;
			else 
				tmp[i][t] = tmp[i-1][j].child1;
			t ++;
			
			if (tmp[i-1][j] == null) 
				tmp[i][t] = null;
			else 
				tmp[i][t] = tmp[i-1][j].child2;
		}
	}
	for(int i=0; i < maxGeneration; i++)
		for (int j=0; j < powerOf(2,i); j++)
			if (tmp[i][j] != null)
				if (tmp[i][j].getName().equals(name)) 
					return tmp[i][j];
	return null;//YOUR CODE HERE
	//throw new IllegalArgumentException("Not Yet Implemented");
}

} // end of class
