// this.state = user = {
//   username: "",
//   password: ""
// }

// State = {
//   entities: {
//     users: {
//       1: {
//         id: 1,
//       },
//     },
//   },
//   session: {
//     currentUserId: 42
//   },
// }

/*
Export API Util functions with the specified parameters:

1. `signup(user)`
2. `login(user)`
3. `logout()`

*/

// create user in backend, log them in, and get user json back
export const signup = (user) => {
  console.log("posting new user");
  return $.ajax({
    url: "/api/users",
    method: "POST",
    data: { user: { username: user.username, password: user.password } }
  })
}

// log in user in backend and get user json back
export const login = (user) => {
  console.log("posting new session");
  return $.ajax({
    url: "/api/session",
    method: "POST",
    data: { user: { username: user.username, password: user.password } }
  })
}

// log out any current user in backend
export const logout = () => {
  console.log("deleting session");
  return $.ajax({
    url: "/api/session",
    method: "DELETE"
  })
}