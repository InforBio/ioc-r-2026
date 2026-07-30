-- Turns ::: {.answer} ... ::: into a collapsed callout-note titled "Show answer".
-- Override the title per-block with ::: {.answer title="..."} if ever needed.
function Div(el)
  if el.classes:includes("answer") then
    el.classes = pandoc.List({"callout-note"})
    el.attributes["collapse"] = "true"
    if not el.attributes["title"] then
      el.attributes["title"] = "Show answer"
    end
  end
  return el
end
