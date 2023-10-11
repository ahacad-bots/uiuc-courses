//UIUC CS125 FALL 2013 MP. File: KeyValueMap.java, CS125 Project: Challenge5-DataStructures, Version: 2013-10-14T15:42:09-0500.735397010
/* 
 * @author pliu15
 */
import java.awt.Color;

public class KeyValueMap { // aka Dictionary or Map
	private Color[] colour = new Color[666];
	private String [] Key = new String[666];
	private int i = -1;
	/**
	 * Adds a key and value. If the key already exists, it replaces the original
	 * entry.
	 */
	public void add(String key, Color value) {
		this.i ++;
		this.colour[this.i] = value;
		this.Key[this.i] = key;
		//throw new RuntimeException("Hi");
	}

	/**
	 * Returns particular Color object previously added to this map.
	 */
	public Color find(String key) {
	for(int x = 0; x < this.i+1; x++){
		if(Key[x].equals(key)) return colour[x];
	}
		return null;
		//throw new RuntimeException("Ho");
	}

	/**
	 * Returns true if the key exists in this map.
	 */
	public boolean exists(String key) {
			if(this.find(key) == null) return false;
		return true;
		//throw new RuntimeException("Hi");
	}

	/**
	 * Removes the key (and the color) from this map.
	 */
	public void remove(String key) {
		if(!this.exists(key)) return;
		int remove = 0;
		for(int x = 0; x < this.i+1; x++){
			if(Key[x].equals(key)) remove = x;
		}
		for (int j = remove ;j < this.i; j++){
        	this.Key[j]=this.Key[j+1];
        	this.colour[j]=this.colour[j+1];
        }
        this.i --;
	}

}

