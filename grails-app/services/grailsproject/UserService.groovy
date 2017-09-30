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

    def updateUserName(User user, def params) {
        def compare = true
        User.all.each {
            if(it.username.equals(params.username))
                compare = false
        }
        return compare
    }

    def updateUserPassword(User user, def params) {
            if (params.password?.trim()) {
                user.password = params.password
                return true
            }
            else {
                return false
            }
    }

    def createUserWithRole(User user, String roleName) {
        def role = Role.get(roleName)
        UserRole.create(user, role, true)
    }

    def updateUserRole(User user, String roleName) {
        UserRole.remove(user, user.getAuthorities()[0])
        UserRole.create(user, Role.get(roleName))
    }

}
