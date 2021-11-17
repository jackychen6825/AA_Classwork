//sign up a user 
export const signUp = user => (
    $.ajax({
        method: 'POST',
        url: '/api/users',
        data: { user },
    })
)

//login a user 
export const signIn = user => (
    $.ajax({
        method: 'POST',
        url: '/api/session',
        data: { user },
    })
)

//log out a user 
export const signOut = () => (
    $.ajax({
        url: '/api/session',
        method: 'DELETE',
    })
)