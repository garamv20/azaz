package test;

public class Array {
	public static void main(String[] args) {
		int arr[][] = new int[3][4];
		int sum = 0;
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				arr[i][j] = (int) (Math.random() * 10);
				sum += arr[i][j];
				System.out.print(arr[i][j] + "\t");
			}
			System.out.println();
		}
		System.out.println("합은 " + sum);
	}
}
