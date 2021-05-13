public class App {
    static int text_size = 28;
    static int letters_size = 27;

    static StringBuilder target = new StringBuilder("METHINKS IT IS LIKE A WEASEL");
    static StringBuilder charset = new StringBuilder("ABCDEFGHIJKLMNOPQRSTUVWXYZ ");
    static int matches = 0;

    static StringBuilder parent = new StringBuilder("");
    static StringBuilder parentMatches = new StringBuilder("");

    static StringBuilder mutate = new StringBuilder("");

    public static void main(String[] args) throws Exception {
        randomParent();

        System.out.println("Texto alvo: " + target.toString());
        System.out.println("Primeiro esp: " + parent.toString());
        int cont = 0;
        while (true) {
            cont += 1;
            getMutate();
            int isEquals = fitness();
            if (isEquals == 1) {
                // igual
                System.out.println("tentativa " + cont + ": SUCESSO");
                break;
            } else if (isEquals == 2) {
                // melhor que o pai
                System.out.println("tentativa " + cont + ": " + calcPercent(matches, text_size) + "% \n");
            }
        }
    }

    static int getRandomNumber(int min, int max) {
        return (int) ((Math.random() * (max - min)) + min);
    }

    static double calcPercent(int val, int max) {
        return (Double.valueOf(val) / Double.valueOf(max)) * 100.0;
    }

    static void randomParent() {
        for (int i = 0; i < text_size; i++) {
            int randomValue = getRandomNumber(0, letters_size);
            parent.append(charset.charAt(randomValue));
            parentMatches.append('f');
            mutate.append(' ');
        }
    }

    static int fitness() {
        StringBuilder auxMatches = new StringBuilder("");
        int cont = 0;
        for (int i = 0; i < text_size; i++) {
            if (mutate.charAt(i) == target.charAt(i)) {
                auxMatches.append('t');
                cont++;
            } else {
                auxMatches.append('f');
            }
        }

        if (cont == text_size) {
            parentMatches = new StringBuilder(auxMatches);
            return 1;
        }

        if (cont >= matches) {
            parent = new StringBuilder(mutate);
            parentMatches = new StringBuilder(auxMatches);
            matches = cont;
            return 2;
        }

        return 0;
    }

    static void getMutate() {
        // Sorteia mudancas no parent e retorna o mutante
        for (int i = 0; i < text_size; i++) {
            if (parentMatches.charAt(i) == 'f') {
                int randomValue = getRandomNumber(0, letters_size);
                mutate.setCharAt(i, charset.charAt(randomValue));
            } else {
                mutate.setCharAt(i, parent.charAt(i));
            }
        }
    }
}
