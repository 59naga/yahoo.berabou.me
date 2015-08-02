# Dependencies
app= require './server'

# Environment
PORT= process.env.PORT ? 59798

# Boot
app.listen PORT

console.log 'Listen on %s',PORT
