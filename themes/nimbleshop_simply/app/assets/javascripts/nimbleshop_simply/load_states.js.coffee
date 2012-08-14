window.App = window.App || {}

class window.App.toggleStates

	stateCodeField: ($country) ->
		$country.parents("div.well").find("[name$='[state_code]']")

	createOption: (state) ->
		($ "<option />", text: state[0], value: state[1])

	updateStates: ($country) ->
		$stateCode = @stateCodeField($country).html('')
		for state in window.countryStateCodes[$country.val()]
			$stateCode.append @createOption(state)

	handler: (evt) =>
		$country = $(evt.target)
		@updateStates $country
		false

	constructor:  ->
		($ "select[name$='[country_code]']").bind('change', @handler)
		#for country in  ($ "select[name$='[country_code]']")
			#$(country).triggerHandler 'change'