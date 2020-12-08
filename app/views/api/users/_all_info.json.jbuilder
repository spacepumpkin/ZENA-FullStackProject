# receives user from either bootstrapping application.html.erb or users#everything

# * For convenience, add key for current user
json.current_user do
  json.partial! "api/users/user.json.jbuilder", user: current_user
end

# ! Add all co-member users later instead of singular user
json.users do
  json.partial! "api/users/users.json.jbuilder", users: [user]
end

json.workspaces do
  json.partial! "api/workspaces/workspaces.json.jbuilder", workspaces: user.workspaces
end

json.projects do
  json.partial! "api/projects/projects.json.jbuilder", projects: user.projects
end

json.assigned_tasks_ids do
  # json.partial! "api/tasks/tasks.json.jbuilder", tasks: user.tasks
  json.array! user.tasks.to_a.map { |task| task.id }
end

# json.tasks({})
# ! More efficient way? Avoid N+1?
all_tasks = [];
user.projects.each do |project|
  tasks = project.tasks.to_a
  unless tasks.empty?
    all_tasks.concat(tasks)
  end
end

json.tasks do
  json.partial! "api/tasks/tasks.json.jbuilder", tasks: all_tasks
end

# ! Mainly for when we have member users
json.users_workspaces do
  json.partial! "api/users/users_workspaces.json.jbuilder", user: user
end

# ! Mainly for when we have member users
json.users_projects do
  json.partial! "api/users/users_projects.json.jbuilder", user: user
end

# ! Add real users tasks later
json.users_tasks({})

# entities: {
#   users: {},
#   workspaces: {},
#   projects: {},
#   usersWorkspaces: {},
#   usersProjects: {},
#   usersTasks: {}
# }
