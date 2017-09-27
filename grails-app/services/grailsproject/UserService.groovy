package grailsproject

import grails.gorm.transactions.Transactional
import org.springframework.web.context.request.RequestContextHolder
import org.springframework.web.context.request.ServletRequestAttributes


@Transactional
class UserService {


    List<User> listUsers(List<User> users) {
        def request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest()
        if (request.isUserInRole("ROLE_MODO")) {
            List<User> usersBelow = new ArrayList<>()
            for(User u : users) {
                    u.getAuthorities().each {
                        if(it.getAuthority().equals("ROLE_USER"))
                            usersBelow.add(u)
                    }
                }
            return usersBelow
        } else {
            return users
        }
    }

    def createUserWithRole(User user, String roleName) {
        def role = Role.get(roleName)
        UserRole.create(user, role, true)
    }

}
