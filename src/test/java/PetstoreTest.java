import com.intuit.karate.junit5.Karate;

public class PetstoreTest {

    @Karate.Test
    Karate testPetstore() {
        // Ejecuta todos los .feature encontrados en el classpath de features
        return Karate.run("classpath:features/petstore_flow.feature");
    }
}