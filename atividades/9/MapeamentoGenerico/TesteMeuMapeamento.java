
import java.util.Collection;

/**
 *
 * @author SteffanoP <steffanoxpereira@gmail.com>
 */
public class TesteMeuMapeamento {
    
    public static void main(String[] args) {
        MeuMapeamentoSteffanoPereira<Integer, String> mis = new MeuMapeamentoSteffanoPereira<>();
        mis.insere(1, "a");
        mis.insere(2, "b");
        mis.insere(3, "c");
        
        boolean v1 = (null == mis.valor(4));
        System.out.println(v1);//true
        
        String v2 = mis.valor(1);
        System.out.println(v2);//"a"
        
        mis.insere(1, "a2");

        Collection<Integer> chaves = mis.chaves();
        String sc = "";
        for (Integer chave : chaves) {
            sc += chave + ",";
        }
        System.out.println(sc);//1,2,3,

        Collection<String> valores = mis.valores();
        String sc2 = "";
        for (String valor : valores) {
            sc2 += valor + ",";
        }
        System.out.println(sc2);//a2,b,c,
        
        MeuMapeamentoSteffanoPereira<String, String> mss = new MeuMapeamentoSteffanoPereira<>();
        mss.insere("1", "a");
        mss.insere("2", "b");
        mss.insere("3", "c");
        
    } 
    
}
