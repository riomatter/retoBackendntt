package karate.runner;
import com.intuit.karate.junit5.Karate;

public class ResourcesRunner {
    @Karate.Test
    Karate test() {
        return Karate.run("classpath:karate/resources/features/RegistrarUsuarios.feature",
                                  "classpath:karate/resources/features/ListarUsuarios.feature",
                                  "classpath:karate/resources/features/ActualizarUsuarios.feature"
        ).relativeTo(getClass());
    }
}