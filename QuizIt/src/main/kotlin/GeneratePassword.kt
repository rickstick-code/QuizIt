import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

fun main() {
    print(BCryptPasswordEncoder().encode("1324"));
}