class Slim::Embedded
  register :handlebars, TagEngine, tag: :script, attributes: { type: "text/x-handlebars" }
  register :handlebars_slim, TagEngine, tag: :script, attributes: { type: "text/x-handlebars" }, engine: StaticTiltEngine
end