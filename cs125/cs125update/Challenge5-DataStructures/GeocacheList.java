//UIUC CS125 FALL 2013 MP. File: GeocacheList.java, CS125 Project: Challenge5-DataStructures, Version: 2013-10-14T15:42:09-0500.735397010
/* 
 * @author pliu15
 */
/**
 * Complete the following GeocacheList, to ensure all unit tests pass.
 * There are several errors in the code below
 *
 * Hint: Get the Geocache class working and passing its tests first.
 */
public class GeocacheList {
	private Geocache[] data = new Geocache[0];
	private int size = 0;

	public Geocache getGeocache(int i) {
		return data[i];
	}

	public int getSize() {
		return size;
	}

	public GeocacheList() {
	}

	public GeocacheList(GeocacheList other, boolean deepCopy) {
		data = new Geocache[other.data.length];
		size = other.size;
		if(!deepCopy){
			this.size = other.getSize();
			this.data = new Geocache[size];
			for (int i = 0; i < data.length; i++){
				this.data[i] = other.data[i];
			}
		}
		else {
			this.size = other.getSize();
			this.data = new Geocache[size];
			for (int i = 0; i < data.length; i++){
				this.data[i] = new Geocache(other.data[i]);
			}
		}
	}

	public void add(Geocache p) {
		size ++;
		if (size > data.length) {
			Geocache[] old = data;
			data = new Geocache[size * 2];
			for (int i = 0; i < old.length; i++)
				data[i] = old[i];
		}
		data[size-1] = p;
	}

	public Geocache removeFromTop() {
		size --;
		Geocache[] newGeo = new Geocache[data.length - 1];
		for (int i = 0; i < data.length - 1; i++)
			newGeo[i] = data[i];
		return null;
	}

	public String toString() {
		StringBuffer s = new StringBuffer("GeocacheList:");
		for (int i = 0; i < size; i++) {
			if (i > 0)
				s.append(',');
			s.append(data[i]);
		}
		return s.toString();
}	}
