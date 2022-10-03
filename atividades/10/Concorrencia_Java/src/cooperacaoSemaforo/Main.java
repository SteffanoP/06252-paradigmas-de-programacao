package cooperacaoSemaforo;

import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {
        final int NUM_INSERIR = 8;
        final int NUM_ESVAZIAR = 4;
        ArrayList<ThreadInserir> hers = new ArrayList<>();
        ArrayList<ThreadEsvaziar> imps = new ArrayList<>();

        BufferSemaforo buf = new BufferSemaforo();

        //Cria Threads que inserem
        for (int i = 1; i <= NUM_INSERIR; i++) 
            hers.add(new ThreadInserir(buf, Character.forDigit(i, 10)));
        
        for (int i = 1; i <= NUM_ESVAZIAR; i++) 
            imps.add(new ThreadEsvaziar(buf, Character.forDigit(i, 10)));

        //Iniciam as Threads que inserem
        for (ThreadInserir her : hers) {
            her.start();;
        }

        for (ThreadEsvaziar imp : imps) {
            imp.start();
        }

        try {
            for (ThreadEsvaziar imp : imps) {
                imp.join();
            }
        } catch (InterruptedException ie) {
        }

        for (ThreadInserir her : hers) {
            her.meuStop();
        }

    }

}
