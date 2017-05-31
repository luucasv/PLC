import java.util.Scanner;

public class Main {
	
	public static void showMenu(Texto txt){
		System.out.print("Actual text is: ");
		txt.show();
		
		System.out.println("Type:");
		System.out.println("1 - Enter new Text");
		System.out.println("2 - Count words in actual text");
		System.out.println("3 - Replace a word in the actual text");
		System.out.println("4 - How many occorencies of a word the is in the text");
		System.out.println("5 - Exit");
	}
	
	public static Texto getNewText(){
		System.out.print("Enter the text you want: ");
		Scanner in = new Scanner(System.in);
		String line = in.nextLine();
		in.next();
		in.close();
		Texto txt = new Texto(line);
		return txt;
	}
	
	public static void main(String[] args) {
		Texto txt;
		System.out.println("Welcome to text editor!!");
		Scanner in = new Scanner(System.in);
		txt = getNewText();
		int cmd = 0;
		do{
			showMenu(txt);
			cmd = in.nextInt();
			if(cmd == 1){
				txt = getNewText();
			}
			else if(cmd == 2){
				System.out.println(txt.quantWords());
			}
			else if(cmd == 3){
				System.out.println("Enter word to be replaced, and the the one to replace it:");
				String from = in.next(), to = in.next();
				txt.replace(from, to);
			}
			else if(cmd == 4){
				System.out.println("Enter the word you want to count");
				String word = in.next();
				System.out.println(txt.countWord(word));
			}
		}while(cmd != 5);
		in.close();
	}
}
