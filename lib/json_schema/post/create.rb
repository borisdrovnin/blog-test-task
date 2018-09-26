module JsonSchema
  module Post
    Create = 
      {
        "description" => "Post", 
        "type" => "object", 
        "required" => ["login", "title", "content"], 
        "properties" => {
          "login" => {
              "type" => "string",
              "minLength" => 1
          }, 
          "title" => {
              "type" => "string",
              "minLength" => 1
          }, 
          "content" => {
              "type" => "string",
              "minLength" => 1
          }
        }
      }
  end
end