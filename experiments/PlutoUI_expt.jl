### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 071d9ca5-9b42-4583-ad96-a48f93453a0e
using PlutoUI

# ╔═╡ 6b8c85c9-4423-4858-92d5-318a9b253f4a
using SpecialFunctions

# ╔═╡ 0c13bcc9-dc96-4725-846d-366765e671f4
using Plots

# ╔═╡ bc532cd2-c75b-11ea-313f-8b5e771c9227
md"""# PlutoUI_expt.jl

"""

# ╔═╡ fddb794c-c75c-11ea-1f55-eb9c178424cd
md"""
# Basics
"""

# ╔═╡ b819e9a8-c760-11ea-11ee-dd01da663b5c
md"## Slider"

# ╔═╡ 34ebf81e-c760-11ea-05bb-376173e7ed10
@bind x Slider(5:15)

# ╔═╡ a4488984-c760-11ea-2930-871f6b400ef5
x

# ╔═╡ 1048d1e0-cc50-11ea-1bf3-d76cae42740a


# ╔═╡ a709fd2e-c760-11ea-05c5-7bf673990de1
md"The first argument is a `Vector` or range. You can set the _default value_ using a keyword argument:"

# ╔═╡ d3811ac2-c760-11ea-0811-131d9f1d3910
@bind y Slider(20:0.1:30, default=25)

# ╔═╡ e97ed554-c60d-4447-b6dd-6c962ab4d51b
beta_params = ["α", "β"]

# ╔═╡ a5453888-3506-4182-a84d-aef30c66387e
SpecialFunctions.gamma(3.5)

# ╔═╡ 78ccd998-d6aa-4506-ab8a-f30a2e3eca0d
B(α, β) = gamma(α) * gamma(β)/ gamma(α+β)

# ╔═╡ ca0c055e-43de-4426-8212-36de151a1a49
beta(x, α, β) = (x^(α-1)*(1-x)^(β-1))/B(α, β)

# ╔═╡ cd9cbe5c-8361-4094-b435-06f3ceb56995
md"## Graphics Examples"

# ╔═╡ 504cd1ce-b94b-4f71-a8f5-d8058b539a0f
plot(0.5:0.25:5, gamma.(0.5:0.25:5), legend=false, title="Γ Function")

# ╔═╡ 8c3c0494-2416-411a-9e25-59da66230a8b
xrange = 0.01:0.01:1.0

# ╔═╡ 6605d010-d0d1-4cc8-a34d-3158b8572b5d
md"""
## Scrubbable

`Scrubbable` makes a number interactive, you can **click and drag** its value left or right. 

Try it in the text below:
"""

# ╔═╡ 756e2c82-6e2f-4d7b-a1ed-5de97be04269
md"""
_If Alice has $(@bind a Scrubbable(20)) apples, 
and she gives $(@bind b Scrubbable(3)) apples to Bob..._
"""

# ╔═╡ c07c5a9e-61f9-4247-86e7-7c3f9956d0ff
md"""
_...then Alice has **$(a - b)** apples left._
"""

# ╔═╡ c3fea1b2-fc11-4c19-9c01-a8e03fda2817
md"""
Use the Live Docs to learn more about `Scrubbable`!
"""

# ╔═╡ 221c308e-3cbe-4689-aa67-8970957f8cb0


# ╔═╡ e49623ac-c760-11ea-3689-c15f2e2f6081
md"## NumberField

A `NumberField` can be used just like a `Slider`, it just looks different:"

# ╔═╡ 314cb85a-c761-11ea-1cba-b73f84a52be8
@bind x_different NumberField(0:100, default=20)

# ╔═╡ 104b55ce-cc4f-11ea-1273-092a1717e399


# ╔═╡ 4513b730-c761-11ea-1460-2dca56081fcf
md"## CheckBox"

# ╔═╡ 4f8e4e1e-c761-11ea-1787-419cab59bb12
@bind z CheckBox()

# ╔═╡ b787ead6-c761-11ea-3b17-41c0a5434f9b
z

# ╔═╡ 177e6bf0-cc50-11ea-0de2-e77544f5c615


# ╔═╡ b08c347e-c761-11ea-1b61-7b69631d078b
md"Default value:"

# ╔═╡ b53c8ffa-c761-11ea-38d1-2d4ad96a7bee
@bind having_fun CheckBox(default=true)

# ╔═╡ adcf4e68-c761-11ea-00bb-c3b15c6dedc0
having_fun

# ╔═╡ 1a562ad4-cc50-11ea-2485-cdec6e1a78dc


# ╔═╡ 5d420570-c764-11ea-396b-cf0db01d34aa
having_fun ? md"🎈🎈" : md"☕"

# ╔═╡ 09393bf2-cc4f-11ea-1e48-cfbedab8e6b4


# ╔═╡ cd1b5872-c761-11ea-2179-57a3cb34d235
md"## TextField"

# ╔═╡ d9e85ed0-c761-11ea-30bf-83ce272526e0
@bind s TextField()

# ╔═╡ e4c262d6-c761-11ea-36b2-055419bfc981
s

# ╔═╡ 0934bc0c-cc50-11ea-0da8-0d6b2f275399


# ╔═╡ e690337c-c761-11ea-08be-ade40a464eb4
md"With a default value:"

# ╔═╡ f1f83980-c761-11ea-1e34-97c0ffca3f67
@bind sentence TextField(default="te dansen omdat men leeft")

# ╔═╡ f985c8de-c761-11ea-126c-1fd79d547b79
sentence

# ╔═╡ 1cbfd28e-cc50-11ea-2c90-a7807e4979ef


# ╔═╡ 0136af80-c762-11ea-2f1a-9dccff334a11
md"You can also create a **multi-line** text box!"

# ╔═╡ 0e6f0508-c762-11ea-0352-09bd694a9b35
@bind poem TextField((30, 3), "Je opent en sluit je armen,\nMaar houdt niets vast.\nHet is net zwemmen")

# (poem by: Sanne de Kroon)

# ╔═╡ 3dcd7002-c765-11ea-323d-a1fb49409011
split(poem, "\n")

# ╔═╡ 0aa3c85e-cc4f-11ea-2fba-4bdd513d9217


# ╔═╡ 5833f7f4-c763-11ea-0b95-9b21a40192a9
md"## Select"

# ╔═╡ 690cf3ac-c763-11ea-10f0-b3e28c380be9
@bind vegetable Select(["potato", "carrot"])

# ╔═╡ 705662e2-c763-11ea-2f6d-cdaffc1fc73a
vegetable

# ╔═╡ 1feebd8f-667a-42fd-965d-5e3167ff7c7a
@bind favourite_function Select([sin, cos, tan, sqrt])

# ╔═╡ 9128d2c1-364c-4446-baaa-6d0593edda47
favourite_function(2)

# ╔═╡ 3930f0d8-cc50-11ea-3de6-d91ac5c6cd9f


# ╔═╡ 787a2c88-c763-11ea-0a32-bb91ca60113d
md"Instead of an array of values, you can also give an array of **pairs**, where the first item is the bound value, and the second item is displayed. "

# ╔═╡ ac8c4dee-c763-11ea-1b2d-c590a2d50d7e
@bind fruit Select(["apple" => "🍎", "melon" => "🍉"])

# ╔═╡ dcda9ad2-c763-11ea-3ec6-093b823ba66d
fruit

# ╔═╡ 0c3ab1f8-cc4f-11ea-0cfb-8f076d2c9836


# ╔═╡ 62c6f866-f0fe-11ea-0961-319f28d040d4
md"""
## MultiSelect

This widget allows the user to select multiple element by holding `Ctrl` / `Cmd` while clicking a more items.
"""

# ╔═╡ a01c8096-f0fe-11ea-3e78-ad8551e84fa1
@bind vegetable_basket MultiSelect(["potato", "carrot", "boerenkool"])

# ╔═╡ a20e30f2-f0fe-11ea-0ca7-c5195c9eb24a
vegetable_basket

# ╔═╡ c819ef3e-f0fe-11ea-1213-9df7597e4e89
md"Just like `Select`, you can also give an array of pairs."

# ╔═╡ b104ba6d-0293-4378-9652-f628f1d08d97
md"""
## MultiCheckBox

This widget allows the user to select multiple elements using checkboxes.
"""

# ╔═╡ 16f2218d-f1bc-4b34-a355-53acfa77fbf5
@bind fruit_basket MultiCheckBox(["apple", "blueberry", "mango"])

# ╔═╡ 2c7811cb-d9ea-470c-8cb7-2b3803489f3f
fruit_basket

# ╔═╡ 78be41d1-7dda-4bec-b75f-fbcf8b7594a7
md"""
You can use `MultiSelect` and `MultiCheckBox` with any vector of objects, not just strings:
"""

# ╔═╡ 90d84f1b-042c-444e-8bac-fe358b6d68a1
@bind my_functions MultiCheckBox([sin, cos, tan])

# ╔═╡ b97cfb04-0c39-4709-9419-9294e677a872
[f(π) for f in my_functions]

# ╔═╡ 283d1177-c605-4652-905b-9a70354cf878
md"Just like `Select`, you can also give an array of pairs. See the Live Docs for `MultiCheckBox` for all the customization options!"

# ╔═╡ 0b1ce22e-c764-11ea-3d60-e799d58aee30
md"## Button"

# ╔═╡ 6d9108a8-c765-11ea-0a38-09a1364998b1
@bind clicked_msg Button("Goodbye world")

# ╔═╡ 7a14e496-c765-11ea-20a1-6fb960009251
clicked_msg

# ╔═╡ 3eff932a-cc50-11ea-366e-812d3854dd4c


# ╔═╡ 7e10fb52-c765-11ea-2a71-0fc347d09885
md"""
### Button as reactive trigger

In the example above, _any cell that references `clicked` will re-evaluate_ when you click the button. This means that you can a button as a **reactive trigger**, by referencing its value in another cell.
"""

# ╔═╡ b91764e8-c765-11ea-27a2-4ba5777fbd89
@bind go Button("Recompute")

# ╔═╡ bb356b12-c765-11ea-2c36-697f4314bb93
let
	go
	
	md"I am $(rand(1:15)) years old!"
end

# ╔═╡ 9276da28-cc4f-11ea-17b3-65eec41a181e


# ╔═╡ 92def54a-cc4f-11ea-12c5-652f2bb46413
md"## FilePicker"

# ╔═╡ 9920e56c-cc4f-11ea-2d5e-f5371c79f048
@bind important_document FilePicker()

# ╔═╡ 44591b34-cc50-11ea-2005-2f7075e6f2db
important_document

# ╔═╡ 4fda3072-cc50-11ea-2804-197b6391b269
md"The file picker is useful if you want to show off your notebook on a dataset or image **uploaded by the reader**. It will work anywhere - you don't access files using their path.

The caveat is that large files might take a long time to get processed: everything needs to pass through the browser. If you are using large datasets, a better option is to use `Select` to let the reader pick a filename. You can then read the file using `Base.read(filename, type)`"

# ╔═╡ 3e5dd7d2-c760-11ea-1dca-6d8720b3558d
md"# Extras"

# ╔═╡ f31668c6-c768-11ea-1501-5f41afa7c83b
md"## Clock"

# ╔═╡ 417390ba-c760-11ea-27df-5908858ae88c
@bind t Clock()

# ╔═╡ 49e7cd06-c760-11ea-3f5d-2741d94278a6
t

# ╔═╡ 31a2f3c4-cc51-11ea-3652-bd814517a4b5


# ╔═╡ 67709812-c760-11ea-2bda-9756ead35749
md"You can set the interval (`5.0` seconds), and disable the UI (`true`):"

# ╔═╡ 4c2b45a0-c760-11ea-2b64-3fefc820cd5b
@bind t_slow Clock(5.0, true)

# ╔═╡ 5be148cc-c760-11ea-0819-a7bb403d27ff
t_slow

# ╔═╡ 347e3d06-cc51-11ea-012c-43e824eaffa2


# ╔═╡ 343d7118-cc51-11ea-387a-fb22d8c73506
md"You can use a `Clock` to drive an animation! Or use it to repeat the same command at an interval: just like with `Button`, you can reference a bound (reactive) variable without actually using it!"

# ╔═╡ 32e41ac2-cc51-11ea-3358-bbead9c68123


# ╔═╡ f74f434a-c768-11ea-079c-fb707e6ba17b
md"## DownloadButton"

# ╔═╡ ea00721c-cc4b-11ea-1e82-0b3dbe6a7f1e
md"""
The download button is not an **input** element that you can `@bind` to, it's an **output** that you can use to get processed data from your notebook easily. The second argument is the _output filename_.
"""

# ╔═╡ fc12280c-c768-11ea-3ebc-ebcd6b3459c1
DownloadButton(poem, "poem.txt")

# ╔═╡ 067cbcde-cc4c-11ea-3eed-972dc6d7bb3b
DownloadButton([0x01, 0x02, 0x03], "secret_data.bin")

# ╔═╡ 7da30d97-b28a-4eb9-a2ef-fad599b549d1
md"""
# High-level inputs
"""

# ╔═╡ 170089cd-f366-4c0a-b58d-fe6e36049db7
md"""
## Confirm

Normally, when you move a [`Slider`](@ref) or type in a [`TextField`](@ref), all intermediate values are sent back to `@bind`. By wrapping an input element in `confirm`, you get a button to manually **control when the value is sent**, intermediate updates are hidden from Pluto.

"""

# ╔═╡ b29215cb-8e7e-4382-822c-cdaa4c473ba1
@bind distance confirm(Slider(1:100))

# ╔═╡ 00f9f608-85bd-4932-b585-39f74dcf53b4
distance

# ╔═╡ 48a9ffbd-cac7-4c4e-85e5-c3d0693e5550
md"""
`confirm` can be wrapper around any input element to create a new one, including inputs from other packages, or inputs that you have made yourself!
"""

# ╔═╡ 5c85ee41-da68-4f5f-b45e-e1de7996747d


# ╔═╡ 8c51343f-cb35-4ff9-9fd8-642ffab57e22
md"""
## Combine

This next high-level component is a bit tricky, but very powerful!

Using `combine`, you can create a single input out of multiple existing ones! In the example below, we create a new input, `wind_speed_input`. Notice that the list of wind directions is *dynamic*: if you add a new direction, a 5th slider will appear!

"""

# ╔═╡ 621f2e82-5ab4-4ab9-a0ff-fb1cc1b41295
import PlutoUI: combine

# ╔═╡ 3912a922-8af4-41e4-8b92-a7ab9b325fa6
"""
	 combined_sliders_input(param_names::Vector)

generates combined sliders, one for each of names in `param_names`
"""
function combined_sliders_input(param_names::Vector)
	
	return combine() do Child
		
		inputs = [
			md""" $(name): $(
				Child(name, Slider(1:100))
			)"""
			
			for name in param_names
		]
		
		md"""
		#### Beta Params
		$(inputs)
		"""
	end
end

# ╔═╡ 58e716cc-d1c7-4370-9fb1-87eb8124d5dd
@bind beta_param_values combined_sliders_input(beta_params)

# ╔═╡ ea491a77-d9ae-4deb-86af-f7637fdb57bb
begin
	plot(xrange, beta.(xrange, beta_param_values.α, beta_param_values.β),
		label = "beta$beta_param_values")
	plot!(legend=false, title="beta(x, α, β) Function")
	plot!(xrange, beta.(xrange, 1, beta_param_values.β),
		label = "beta(1, $(beta_param_values.β) )")
	plot!(xrange, beta.(xrange, beta_param_values.α, 1),
		label = "beta( $(beta_param_values.α), 1)")
end

# ╔═╡ 3473276f-ebe4-467c-9951-df62562e1c3f
beta_param_values

# ╔═╡ a4837897-caae-447a-8db9-7775e7a4d0c8


# ╔═╡ d278189e-6a5b-428a-8c81-ce3d206b042c
function wind_speed_input(directions::Vector)
	
	return combine() do Child
		
		inputs = [
			md""" $(name): $(
				Child(name, Slider(1:100))
			)"""
			
			for name in directions
		]
		
		md"""
		#### Wind speeds
		$(inputs)
		"""
	end
end

# ╔═╡ f5c421cc-dbdb-459a-9bb4-d648507a87d2
@bind speeds wind_speed_input(["North", "East", "South", "West"])

# ╔═╡ a4eac824-ba87-473a-b39a-783c4de3f933
speeds

# ╔═╡ f9052ed8-84cc-4cca-abb2-9363aafc6040
speeds.North

# ╔═╡ 4ca9c749-08ee-467f-af2c-9b2f13199d72
md"""
Use the Live Docs to learn more about `combine` and to see additional examples. 

> 🙋 `combine` is very useful in combination with [HypertextLiteral.jl](https://github.com/MechanicalRabbit/HypertextLiteral.jl), which you can learn using our JavaScript sample notebook. 
"""

# ╔═╡ ad8e9b30-c75d-11ea-1fd0-0b53592135bf
md"""# Loading resources

Notebooks use data from different places. For example, you use [`Base.read`](https://docs.julialang.org/en/v1/base/io-network/#:~:text=read(filename%3A%3AAbstractString%2C%20String)) to access local data (files) inside your Julia code, and [`Downloads.jl`](https://github.com/JuliaLang/Downloads.jl) for remote data (interwebs). 

`PlutoUI` helps you communicate with the person reading the notebook!
- To get **remote media** (URL) inside your **Markdown text**, use `PlutoUI.Resource`.
- To get **local media** (file) inside your **Markdown text**, use `PlutoUI.LocalResource`.

(With _media_, we mean **images**, video and audio.)

> We **strongly recommend** that you use _remote_ media inside Pluto notebooks! 
> 
> If your notebook uses local images, then those images **will not show** when someone else opens your notebook, unless they have the same images on their computer, at the exact same location. _More on this later._

"""

# ╔═╡ 87d088d0-cc54-11ea-02c6-bd673b95b9d3
md"""## Resource

If you just want to show **images inside Markdown**, you can use the built-in syntax (without `PlutoUI`):

```
md"Here is a _dog_: ![](https://fonsp.com/img/doggoSmall.jpg)"
```

`PlutoUI.Resource` has some extra features:
- specify **image dimensions** and spacing
- support for videos
- support for audio"""

# ╔═╡ 6a7e7e54-c75e-11ea-2ea7-ed3da37e9e96
dog_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Welsh_Springer_Spaniel.jpg/640px-Welsh_Springer_Spaniel.jpg"

# ╔═╡ 3c68b25c-c761-11ea-226a-4f46579a6732
Resource(dog_url, :width => x * x_different)

# ╔═╡ 9ac7921c-c75e-11ea-30f5-c35e6ee370cb
t_rex_url = "https://upload.wikimedia.org/wikipedia/commons/transcoded/6/62/Meow.ogg/Meow.ogg.mp3"

# ╔═╡ a8c57442-c75e-11ea-1913-7d82cbd2c69c
flower_url = "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_Flower_Opening_Time_Lapse.ogv"

# ╔═╡ cb37b916-c75b-11ea-0c83-6ba759536075
md"""Hello I am a dog $(Resource(dog_url))"""

# ╔═╡ 16ea31fc-c75e-11ea-0f2d-dd790a56b2dc
md"""And I sound like this: $(Resource(t_rex_url))"""

# ╔═╡ 1dfd8cc6-c75e-11ea-3c04-a96734779c97
md"""This is my flower friend

$(Resource(flower_url, :width => 200))"""

# ╔═╡ 2fda30ea-c75e-11ea-2ff5-7f2dcf4f9b66
md"### Attributes

You can pass additional _HTML attributes_ to `Resource`, these will be added to the element. For example:"

# ╔═╡ 525ceea0-c75e-11ea-2766-f72418fd784e
md"""
$(Resource(dog_url, :width => 20))
$(Resource(dog_url, :width => 50))
$(Resource(dog_url, :width => 100))
$(Resource(dog_url, 
	:width => 100, 
	:style => "filter: grayscale(100%); border: 3px solid black;"))
"""

# ╔═╡ 382d41d8-c75e-11ea-2ae3-2ffe96e04b5a
Resource(flower_url, :width => 200, :autoplay => "", :loop => "")

# ╔═╡ 958ab19c-cc56-11ea-162e-d3664e66ff66
md"### YouTube, Vimeo, etc.

If you use `Resource` for video, the URL has to point to a _video file_ (like `.mp4` or `.mov`). 

Popular video sites don't give you that link, instead, you can use their **embed codes**. You can find these inside the video player, by right clicking or using the menu buttons. You then use that inside an HTML block:
```
html\"\"\"
~ paste embed code here ~
\"\"\"
```

You might need to change the `width` to `100%` to make it fit."

# ╔═╡ 8477619c-cc57-11ea-0618-1778c502d28f
html"""

<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/438210156" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>

"""

# ╔═╡ f743076c-cc57-11ea-1a8e-8799d9db985a


# ╔═╡ c65d28a2-c75d-11ea-2e13-7332f93d9c5e
md"## LocalResource _(not recommended)_

The examples above use `Resource` to make media from a URL available inside Markdown. To use **local files**, simply **replace `Resource` with `LocalResource`**, and use a _file path_ instead of a URL."

# ╔═╡ c16dff74-cc5d-11ea-380c-aff1639b5551


# ╔═╡ dada2154-c75d-11ea-2312-b9156a9a531e
html"<span style='font-family: cursive; color: purple;'>I really hope that this works</span>"

# ╔═╡ f809110c-cc55-11ea-1551-e138c28d5d82
md"""Hello I am a dog $(LocalResource("C:\\Users\\fons\\Pictures\\hannes.jpg"))"""

# ╔═╡ 1c930364-cc58-11ea-36c8-0ddf7c4700cd
md""" $(html"<span style='font-family: cursive; color: purple;'>OOPS</span>"), it didn't!

$(html"<br>")

Here are **two tips** for getting local images to work correctly:

1. Go to [imgur.com](https://imgur.com) and drag&drop the image to the page. Right click on the image, and select "Copy image location". You can now use the image like so: 

   ```PlutoUI.Resource("https://i.imgur.com/SAzsMMA.jpg")```


2. If your notebook is part of a git repository, place the image in the repository and use a relative path: 
   
    ```PlutoUI.LocalResource("../images/cat.jpg")```


"""

# ╔═╡ c48b48f6-cc5d-11ea-0f3b-d3481238625d


# ╔═╡ ea6ade22-cc5a-11ea-1782-97f2464fd148
md"#### Why does it have to be so difficult?

Pluto only stores _code_ in the notebook file, not images. This minimal file format is very valuable, but it means that images need to be _addressed_, not stored.

Addressing _local files_ is fragile: if someone else opens the notebook, or if you move the notebook to a different folder, that image file needs to be available at exactly the same path. This is difficult to do correctly, and if it works for you, it is hard to tell if it will work for someone else. 

Putting images online might be a hassle, but once it works, it will work everywhere! The stateless nature of URLs means that the images will work regardless of how the notebook file is accessed, while keeping a minimal file format."

# ╔═╡ a245dddc-cc59-11ea-3e1d-1763673ff706
md"# PlutoUI without Pluto

Huh?

Did you know that you can run Pluto notebooks _without Pluto_? If your notebook is called `wow.jl`, then 
```sh
$ julia wow.jl
```
will run the notebook just fine. 

When you use `@bind`, your notebook can still run without Pluto! Sort of. Normally, all bound variables are assigned the value `missing` when you run it elsewhere. However, the `PlutoUI` types have all been configured to assign a more sensible default value.

For example, if your notebook contains
```julia
@bind x Slider(10:20)
```
and you run it without Pluto, then this statement simply assigns `x = 10`.
"

# ╔═╡ 0cda8986-cc64-11ea-2acc-b5c38fdf17e5


# ╔═╡ 0da7bc30-cc64-11ea-1dde-2b7f2dd76036
md"`Pluto` and `PlutoUI` work independently of each other! In fact, _you_ could write a package with fun input elements, or add `@bind`able values to existing packages."

# ╔═╡ 512fe760-cc4c-11ea-1c5b-2b32da035aad
md"# Appendix"

# ╔═╡ 55bcdbf8-cc4c-11ea-1549-87c076a59ff4
space = html"<br><br><br>"

# ╔═╡ fb6142f6-c765-11ea-29fd-7ff4e823c02b
space

# ╔═╡ ebfc61b0-c765-11ea-1d66-cbf1dcdb8bdb
space

# ╔═╡ f69a5d5e-c765-11ea-3fa0-230c6c619730
space

# ╔═╡ 0b66c781-ecf2-445e-b2aa-82cb13371e46
space

# ╔═╡ 35523932-cc4f-11ea-0908-2d51c57176b7
space

# ╔═╡ d163f434-cc5a-11ea-19e9-9319ba994efa
space

# ╔═╡ 7ccd94c6-0790-4554-b576-d31d9a48bc5f
In probability theory and statistics, the beta distribution is a family of continuous probability distributions defined on the interval [0, 1] parameterized by two positive shape parameters, denoted by α and β, that appear as exponents of the random variable and control the shape of the distribution.

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
SpecialFunctions = "276daf66-3868-5448-9aa4-cd146d93841b"

[compat]
Plots = "~1.25.6"
PlutoUI = "~0.7.24"
SpecialFunctions = "~2.0.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "abb72771fd8895a7ebd83d5632dc4b989b022b5b"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.2"

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "af92965fb30777147966f58acb05da51c5616b5f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.3"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "926870acb6cbcf029396f2f2de030282b6bc1941"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.11.4"

[[ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "bf98fa45a0a4cee295de98d4c1462be26345b9a1"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.2"

[[ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "6b6f04f93710c71550ec7e16b650c1b9a612d0b6"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.16.0"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "44c37b4636bc54afac5c574d2d02b625349d6582"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.41.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "3daef5523dd2e769dad2365274f760ff5f282c7d"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.11"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b3bfd02e98aedfa5cf885665493c5598c350cd2f"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.2.10+0"

[[FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "d8a578692e3077ac998b50c0217dfd67f21d1e5f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.0+0"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "0c603255764a1fa0b61752d2bec14cfbd18f7fe8"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.5+1"

[[GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "RelocatableFolders", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "4a740db447aae0fbeb3ee730de1afbb14ac798a1"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.63.1"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "aa22e1ee9e722f1da183eb33370df4c1aeb6c2cd"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.63.1+0"

[[GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "58bcdf5ebc057b085e58d95c138725628dd7453c"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.1"

[[Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "a32d672ac2c967f3deb8a81d828afc739c838a06"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+2"

[[Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "0fa77022fe4b511826b39c894c90daf5fce3334a"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.17"

[[HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "a7254c0acd8e62f1ac75ad24d5db43f5f19f3c65"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.2"

[[IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "22df5b96feef82434b07327e2d3c770a9b21e023"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d735490ac75c5cb9f1b00d8b5509c11984dc6943"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.0+0"

[[LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "a8f4f279b6fa3c3c4f1adadd78a621b13a506bce"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.9"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "340e257aada13f95f98ee352d316c3bed37c8ab9"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+0"

[[Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "e5718a00af0ab9756305a0392832c8952c7426c1"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.6"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NaNMath]]
git-tree-sha1 = "f755f36b19a5116bb580de457cda0c140153f283"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.6"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"

[[OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "648107615c15d4e09f7eca16307bc821c1f718d8"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.13+0"

[[OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "d7fa6237da8004be601e19bd6666083056649918"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.3"

[[Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "68604313ed59f0408313228ba09e79252e4b2da8"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.1.2"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "db7393a80d0e5bef70f2b518990835541917a544"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.25.6"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "6c9fa3e4880242c666dafa4901a34d8e1cd1b243"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.24"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "2cf929d64681236a2e074ffafb8d568733d2e6af"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.3"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RecipesBase]]
git-tree-sha1 = "6bf3f380ff52ce0832ddd3a2a7b9538ed1bcca7d"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.2.1"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "37c1631cb3cc36a535105e6d5557864c82cd8c2b"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.5.0"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "cdbd3b1338c72ce29d9584fdbe9e9b70eeb5adca"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "0.1.3"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "e08890d19787ec25029113e88c34ec20cac1c91e"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.0.0"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "2ae4fe21e97cd13efd857462c1869b73c9f61be3"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.3.2"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsAPI]]
git-tree-sha1 = "d88665adc9bcf45903013af0982e2fd05ae3d0a6"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.2.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "51383f2d367eb3b444c961d485c565e4c0cf4ba0"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.14"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "d21f2c564b21a202f4677c0fba5b5ee431058544"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.4"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "bb1064c9a84c52e277f1096cf41434b675cd368b"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.6.1"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[Unzip]]
git-tree-sha1 = "34db80951901073501137bdbc3d5a8e7bbd06670"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.1.2"

[[Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "66d72dc6fcc86352f01676e8f0f698562e60510f"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.23.0+0"

[[XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "cc4bf3fdde8b7e3e9fa0351bdeedba1cf3b7f6e6"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.0+0"

[[libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "c45f4e40e7aafe9d086379e5578947ec8b95a8fb"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+0"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
"""

# ╔═╡ Cell order:
# ╠═bc532cd2-c75b-11ea-313f-8b5e771c9227
# ╠═071d9ca5-9b42-4583-ad96-a48f93453a0e
# ╟─fb6142f6-c765-11ea-29fd-7ff4e823c02b
# ╟─fddb794c-c75c-11ea-1f55-eb9c178424cd
# ╟─b819e9a8-c760-11ea-11ee-dd01da663b5c
# ╠═34ebf81e-c760-11ea-05bb-376173e7ed10
# ╠═a4488984-c760-11ea-2930-871f6b400ef5
# ╟─1048d1e0-cc50-11ea-1bf3-d76cae42740a
# ╟─a709fd2e-c760-11ea-05c5-7bf673990de1
# ╠═d3811ac2-c760-11ea-0811-131d9f1d3910
# ╠═e97ed554-c60d-4447-b6dd-6c962ab4d51b
# ╠═3912a922-8af4-41e4-8b92-a7ab9b325fa6
# ╠═6b8c85c9-4423-4858-92d5-318a9b253f4a
# ╠═a5453888-3506-4182-a84d-aef30c66387e
# ╠═ca0c055e-43de-4426-8212-36de151a1a49
# ╠═78ccd998-d6aa-4506-ab8a-f30a2e3eca0d
# ╠═cd9cbe5c-8361-4094-b435-06f3ceb56995
# ╠═0c13bcc9-dc96-4725-846d-366765e671f4
# ╠═504cd1ce-b94b-4f71-a8f5-d8058b539a0f
# ╠═8c3c0494-2416-411a-9e25-59da66230a8b
# ╠═ea491a77-d9ae-4deb-86af-f7637fdb57bb
# ╠═58e716cc-d1c7-4370-9fb1-87eb8124d5dd
# ╠═3473276f-ebe4-467c-9951-df62562e1c3f
# ╟─6605d010-d0d1-4cc8-a34d-3158b8572b5d
# ╠═756e2c82-6e2f-4d7b-a1ed-5de97be04269
# ╠═c07c5a9e-61f9-4247-86e7-7c3f9956d0ff
# ╟─c3fea1b2-fc11-4c19-9c01-a8e03fda2817
# ╟─221c308e-3cbe-4689-aa67-8970957f8cb0
# ╟─e49623ac-c760-11ea-3689-c15f2e2f6081
# ╠═314cb85a-c761-11ea-1cba-b73f84a52be8
# ╠═3c68b25c-c761-11ea-226a-4f46579a6732
# ╟─104b55ce-cc4f-11ea-1273-092a1717e399
# ╟─4513b730-c761-11ea-1460-2dca56081fcf
# ╠═4f8e4e1e-c761-11ea-1787-419cab59bb12
# ╟─b787ead6-c761-11ea-3b17-41c0a5434f9b
# ╟─177e6bf0-cc50-11ea-0de2-e77544f5c615
# ╟─b08c347e-c761-11ea-1b61-7b69631d078b
# ╠═b53c8ffa-c761-11ea-38d1-2d4ad96a7bee
# ╟─adcf4e68-c761-11ea-00bb-c3b15c6dedc0
# ╟─1a562ad4-cc50-11ea-2485-cdec6e1a78dc
# ╟─5d420570-c764-11ea-396b-cf0db01d34aa
# ╟─09393bf2-cc4f-11ea-1e48-cfbedab8e6b4
# ╟─cd1b5872-c761-11ea-2179-57a3cb34d235
# ╠═d9e85ed0-c761-11ea-30bf-83ce272526e0
# ╟─e4c262d6-c761-11ea-36b2-055419bfc981
# ╟─0934bc0c-cc50-11ea-0da8-0d6b2f275399
# ╟─e690337c-c761-11ea-08be-ade40a464eb4
# ╠═f1f83980-c761-11ea-1e34-97c0ffca3f67
# ╟─f985c8de-c761-11ea-126c-1fd79d547b79
# ╟─1cbfd28e-cc50-11ea-2c90-a7807e4979ef
# ╟─0136af80-c762-11ea-2f1a-9dccff334a11
# ╠═0e6f0508-c762-11ea-0352-09bd694a9b35
# ╠═3dcd7002-c765-11ea-323d-a1fb49409011
# ╟─0aa3c85e-cc4f-11ea-2fba-4bdd513d9217
# ╟─5833f7f4-c763-11ea-0b95-9b21a40192a9
# ╠═690cf3ac-c763-11ea-10f0-b3e28c380be9
# ╠═705662e2-c763-11ea-2f6d-cdaffc1fc73a
# ╠═1feebd8f-667a-42fd-965d-5e3167ff7c7a
# ╠═9128d2c1-364c-4446-baaa-6d0593edda47
# ╟─3930f0d8-cc50-11ea-3de6-d91ac5c6cd9f
# ╟─787a2c88-c763-11ea-0a32-bb91ca60113d
# ╠═ac8c4dee-c763-11ea-1b2d-c590a2d50d7e
# ╠═dcda9ad2-c763-11ea-3ec6-093b823ba66d
# ╟─0c3ab1f8-cc4f-11ea-0cfb-8f076d2c9836
# ╟─62c6f866-f0fe-11ea-0961-319f28d040d4
# ╠═a01c8096-f0fe-11ea-3e78-ad8551e84fa1
# ╠═a20e30f2-f0fe-11ea-0ca7-c5195c9eb24a
# ╟─c819ef3e-f0fe-11ea-1213-9df7597e4e89
# ╟─b104ba6d-0293-4378-9652-f628f1d08d97
# ╠═16f2218d-f1bc-4b34-a355-53acfa77fbf5
# ╠═2c7811cb-d9ea-470c-8cb7-2b3803489f3f
# ╟─78be41d1-7dda-4bec-b75f-fbcf8b7594a7
# ╠═90d84f1b-042c-444e-8bac-fe358b6d68a1
# ╠═b97cfb04-0c39-4709-9419-9294e677a872
# ╟─283d1177-c605-4652-905b-9a70354cf878
# ╟─0b1ce22e-c764-11ea-3d60-e799d58aee30
# ╠═6d9108a8-c765-11ea-0a38-09a1364998b1
# ╠═7a14e496-c765-11ea-20a1-6fb960009251
# ╟─3eff932a-cc50-11ea-366e-812d3854dd4c
# ╟─7e10fb52-c765-11ea-2a71-0fc347d09885
# ╠═b91764e8-c765-11ea-27a2-4ba5777fbd89
# ╠═bb356b12-c765-11ea-2c36-697f4314bb93
# ╟─9276da28-cc4f-11ea-17b3-65eec41a181e
# ╟─92def54a-cc4f-11ea-12c5-652f2bb46413
# ╠═9920e56c-cc4f-11ea-2d5e-f5371c79f048
# ╠═44591b34-cc50-11ea-2005-2f7075e6f2db
# ╟─4fda3072-cc50-11ea-2804-197b6391b269
# ╟─ebfc61b0-c765-11ea-1d66-cbf1dcdb8bdb
# ╟─3e5dd7d2-c760-11ea-1dca-6d8720b3558d
# ╟─f31668c6-c768-11ea-1501-5f41afa7c83b
# ╠═417390ba-c760-11ea-27df-5908858ae88c
# ╠═49e7cd06-c760-11ea-3f5d-2741d94278a6
# ╟─31a2f3c4-cc51-11ea-3652-bd814517a4b5
# ╟─67709812-c760-11ea-2bda-9756ead35749
# ╠═4c2b45a0-c760-11ea-2b64-3fefc820cd5b
# ╠═5be148cc-c760-11ea-0819-a7bb403d27ff
# ╟─347e3d06-cc51-11ea-012c-43e824eaffa2
# ╟─343d7118-cc51-11ea-387a-fb22d8c73506
# ╟─32e41ac2-cc51-11ea-3358-bbead9c68123
# ╟─f74f434a-c768-11ea-079c-fb707e6ba17b
# ╟─ea00721c-cc4b-11ea-1e82-0b3dbe6a7f1e
# ╠═fc12280c-c768-11ea-3ebc-ebcd6b3459c1
# ╠═067cbcde-cc4c-11ea-3eed-972dc6d7bb3b
# ╟─f69a5d5e-c765-11ea-3fa0-230c6c619730
# ╟─7da30d97-b28a-4eb9-a2ef-fad599b549d1
# ╟─170089cd-f366-4c0a-b58d-fe6e36049db7
# ╠═b29215cb-8e7e-4382-822c-cdaa4c473ba1
# ╠═00f9f608-85bd-4932-b585-39f74dcf53b4
# ╟─48a9ffbd-cac7-4c4e-85e5-c3d0693e5550
# ╟─5c85ee41-da68-4f5f-b45e-e1de7996747d
# ╟─8c51343f-cb35-4ff9-9fd8-642ffab57e22
# ╠═621f2e82-5ab4-4ab9-a0ff-fb1cc1b41295
# ╟─a4837897-caae-447a-8db9-7775e7a4d0c8
# ╠═f5c421cc-dbdb-459a-9bb4-d648507a87d2
# ╠═a4eac824-ba87-473a-b39a-783c4de3f933
# ╠═f9052ed8-84cc-4cca-abb2-9363aafc6040
# ╠═d278189e-6a5b-428a-8c81-ce3d206b042c
# ╟─4ca9c749-08ee-467f-af2c-9b2f13199d72
# ╟─0b66c781-ecf2-445e-b2aa-82cb13371e46
# ╟─ad8e9b30-c75d-11ea-1fd0-0b53592135bf
# ╟─87d088d0-cc54-11ea-02c6-bd673b95b9d3
# ╟─6a7e7e54-c75e-11ea-2ea7-ed3da37e9e96
# ╟─9ac7921c-c75e-11ea-30f5-c35e6ee370cb
# ╟─a8c57442-c75e-11ea-1913-7d82cbd2c69c
# ╠═cb37b916-c75b-11ea-0c83-6ba759536075
# ╠═16ea31fc-c75e-11ea-0f2d-dd790a56b2dc
# ╠═1dfd8cc6-c75e-11ea-3c04-a96734779c97
# ╟─2fda30ea-c75e-11ea-2ff5-7f2dcf4f9b66
# ╠═525ceea0-c75e-11ea-2766-f72418fd784e
# ╠═382d41d8-c75e-11ea-2ae3-2ffe96e04b5a
# ╟─958ab19c-cc56-11ea-162e-d3664e66ff66
# ╠═8477619c-cc57-11ea-0618-1778c502d28f
# ╟─f743076c-cc57-11ea-1a8e-8799d9db985a
# ╟─c65d28a2-c75d-11ea-2e13-7332f93d9c5e
# ╟─c16dff74-cc5d-11ea-380c-aff1639b5551
# ╟─dada2154-c75d-11ea-2312-b9156a9a531e
# ╠═f809110c-cc55-11ea-1551-e138c28d5d82
# ╟─1c930364-cc58-11ea-36c8-0ddf7c4700cd
# ╟─c48b48f6-cc5d-11ea-0f3b-d3481238625d
# ╟─ea6ade22-cc5a-11ea-1782-97f2464fd148
# ╟─35523932-cc4f-11ea-0908-2d51c57176b7
# ╟─a245dddc-cc59-11ea-3e1d-1763673ff706
# ╟─0cda8986-cc64-11ea-2acc-b5c38fdf17e5
# ╟─0da7bc30-cc64-11ea-1dde-2b7f2dd76036
# ╟─d163f434-cc5a-11ea-19e9-9319ba994efa
# ╟─512fe760-cc4c-11ea-1c5b-2b32da035aad
# ╠═55bcdbf8-cc4c-11ea-1549-87c076a59ff4
# ╠═7ccd94c6-0790-4554-b576-d31d9a48bc5f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
