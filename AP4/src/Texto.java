import java.util.Scanner;

public class Texto {
	private String[] words;
	Texto(String txt){
		this.words = Texto.readWords(txt);
	}
	
	public void show(){
		System.out.print(this.words[0]);
		for(int i = 1; i < this.words.length; ++i){
			System.out.print(" " + this.words[i]);
		}
	}
	
	public int countWord(String word){
		int count = 0;
		for(int i = 0; i < this.words.length; ++i){
			if(this.words[i] == word){
				++count;
			}
		}
		return count;
	}
	
	public int quantWords(){
		return this.words.length;
	}
	
	public void replace(String from, String to){
		for(int i = 0; i < this.words.length; ++i){
			if(this.words[i].equals(from)){
				this.words[i] = to;
			}
		}
	}
	
	static private int countWords(String txt){
		Scanner sc = new Scanner(txt);
		int count = 0;
		while(sc.hasNext()){
			sc.next();
			++count;
		}
		sc.close();
		return count;
	}
	
	static private String[] readWords(String txt){
		int quantWords = Texto.countWords(txt);
		String[] words = new String[quantWords];
		Scanner sc = new Scanner(txt);
		for(int i = 0; i < quantWords; ++i){
			words[i] = sc.next();
		}
		sc.close();
		return words;
	}
}
