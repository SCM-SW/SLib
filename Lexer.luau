type Ruvxlo = (cqhadb: "__LEXERSTATEINIT" | string, dkferp: iumbqo) -> (string?, {string}?, string?)
type iumbqo = {
	cursor: number,
	source: string,
	tokens: {Grvplq},
	[any]: any
}

type Grvplq = {
	Content: string,
	Types: {string},
	HasType: (self: Grvplq, type: string) -> boolean,
	AddType: (self: Grvplq, type: string) -> nil,
}

type Mlxfri = {
	Type: string,
	Pattern: string
}

local Vjerna = {}
Vjerna.__index = Vjerna


local Wpzyrq = {}

Wpzyrq.Token = Vjerna

Wpzyrq.Presets = {
	JSON = function(cqhadb: string, dkferp: iumbqo)
		if cqhadb == '__LEXERSTATEINIT' then
			dkferp.ahplsv = {
				{Type = 'string', Pattern = '"[^"]*"'},
				{Type = 'constructor', Pattern = '(%w+)%([^)]*%)'},

				{Type = 'number', Pattern = '0b[01]+'},
				{Type = 'number', Pattern = '0x%x+'},
				{Type = 'number', Pattern = '%d*%.%d+'},
				{Type = 'number', Pattern = '%d+e%-?%d+'},
				{Type = 'number', Pattern = '%d+'},

				{Type = 'parameter', Pattern = '%(([^)]+)%)'},
				{Type = 'assignment', Pattern = ':'},
				{Type = 'enum', Pattern = 'Enum%.%w+%.%w+'},
				{Type = 'operator', Pattern = '[{}%(%)%[%]]+'},
			} :: {Mlxfri}

			dkferp.vtkldp = function(sgexmr: string, nlvdpu: number)
				local ivkhnz, hyetpc = Wpzyrq:GTokenstp(sgexmr, nlvdpu, dkferp.ahplsv)
				for wlsqmo, kbucfe in ipairs(ivkhnz) do
					if not kbucfe:HasType('assignment') then
						continue
					end

					local zpwhrl = ivkhnz[wlsqmo - 1] or dkferp.tokens[#dkferp.tokens]

					if not zpwhrl or not zpwhrl:HasType('string') then
						continue
					end

					zpwhrl:AddType('index')
				end

				return ivkhnz, hyetpc
			end

			return
		end

		local ivkhnz, hyetpc = dkferp.vtkldp(dkferp.source, dkferp.cursor)
		dkferp.cursor = hyetpc
		return ivkhnz
	end,
	Lua = function(cqhadb: string, dkferp: iumbqo)
		if cqhadb == '__LEXERSTATEINIT' then
			dkferp.bfjqtw = {
				["and"] = "keyword",
				["break"] = "keyword",
				["continue"] = "keyword",
				["do"] = "keyword",
				["else"] = "keyword",
				["elseif"] = "keyword",
				["end"] = "keyword",
				["export"] = "keyword",
				["false"] = "keyword",
				["for"] = "keyword",
				["function"] = "keyword",
				["if"] = "keyword",
				["in"] = "keyword",
				["local"] = "keyword",
				["nil"] = "keyword",
				["not"] = "keyword",
				["or"] = "keyword",
				["repeat"] = "keyword",
				["return"] = "keyword",
				["self"] = "keyword",
				["then"] = "keyword",
				["true"] = "keyword",
				["type"] = "keyword",
				["typeof"] = "keyword",
				["until"] = "keyword",
				["while"] = "keyword",
			}

			dkferp.ahplsv = {
				{Type = 'string', Pattern = '"[^"]*"'},
				{Type = 'string', Pattern = "'[^']*'"},

				{Type = 'number', Pattern = '%d+e%-?%d+'},
				{Type = 'number', Pattern = '0x%x+'},

				{Type = 'method', Pattern = '([%a_][%w_]*)%([^%)]*%)?'},
				{Type = 'var', Pattern = '[%a_][%w_]*'},

				{Type = 'number', Pattern = '0b[01]+'},
				{Type = 'number', Pattern = '%d*%.%d+'},
				{Type = 'number', Pattern = '%d+'},

				{Type = 'operator', Pattern = '[%+%-%*/%^%%#%(%)%[%]{}=<>,.:;]+'},
			} :: {Mlxfri}

			dkferp.vtkldp = function(sgexmr: string, nlvdpu: number)
				return Wpzyrq:GTokenstp(sgexmr, nlvdpu, dkferp.ahplsv)
			end

			return
		end

		local ivkhnz, hyetpc = dkferp.vtkldp(dkferp.source, dkferp.cursor)

		for _, kbucfe in ipairs(ivkhnz) do
			if kbucfe:HasType('var') then
				if kbucfe.Content:match('^[%u_]+$') then
					kbucfe:AddType('constant')
				end
			end

			if dkferp.bfjqtw[kbucfe.Content] then
				kbucfe:AddType('keyword')
			end
		end

		dkferp.cursor = hyetpc
		return ivkhnz
	end
}

function Wpzyrq:GTokenstp(sgexmr: string, nlvdpu: number, ahplsv: {Mlxfri}): {Grvplq}
	table.insert(ahplsv, {Type = 'whitespace', Pattern = '^%s+'}) -- combine whitespaces into single tokens so they don't take up so much space
	table.insert(ahplsv, {Type = 'ind', Pattern = '^.'}) -- mainly so it doesnt just crash when theres nothing to capture

	local ivkhnz = {}

	for _, dpgswe in ipairs(ahplsv) do
		local yifvsj = string.match(sgexmr, dpgswe.Pattern, nlvdpu)
		if not yifvsj then
			continue
		end

		local axtzpk, jwcmro = string.find(sgexmr, yifvsj, nlvdpu, true)
		if not axtzpk or not jwcmro then
			continue
		end

		local vbltyw = string.sub(sgexmr, nlvdpu, axtzpk - 1)
		if vbltyw:len() > 0 then
			local scunrf = 0
			while scunrf <= #vbltyw do
				local fkbnec, kshtrl = Wpzyrq:GTokenstp(vbltyw, scunrf, ahplsv)
				scunrf = kshtrl

				for _, qztmka in ipairs(fkbnec) do
					table.insert(ivkhnz, qztmka)
				end
			end
		end

		nlvdpu = jwcmro + 1

		table.insert(ivkhnz, Vjerna.new(string.sub(sgexmr, axtzpk, jwcmro), {dpgswe.Type}))

		break
	end

	return ivkhnz, nlvdpu
end

function Wpzyrq:GTokenize(dpgswe: string, cqhadb: Ruvxlo): {Grvplq}
	local dkferp = {
		source = dpgswe,
		cursor = 1,
		tokens = {},
	}

	cqhadb('__LEXERSTATEINIT', dkferp)

	local bxvmlr = dpgswe:len()

	while dkferp.cursor <= bxvmlr do
		local ykhape = dpgswe:sub(dkferp.cursor, dkferp.cursor)
		local twcrng = cqhadb(ykhape, dkferp)

		if twcrng then
			for _, qztmka in ipairs(twcrng) do
				table.insert(dkferp.tokens, qztmka)
			end
		end
	end

	return dkferp.tokens
end

function Wpzyrq:GStringTokens(ivkhnz: {Grvplq}, bkgyxv: (Grvplq) -> string)
	local hfrekd = ""

	for _, qztmka in ipairs(ivkhnz) do
		local eylhdz = qztmka.Content

		if bkgyxv then
			eylhdz = bkgyxv(qztmka) or eylhdz
		end

		hfrekd ..= eylhdz
	end

	return hfrekd
end

function Wpzyrq:GColorTokens(ivkhnz: {Grvplq}, nqsjwv: {{Type: string, Color: Color3}})
	return Wpzyrq:GStringTokens(ivkhnz, function(qztmka)
		for _, vtyxum in ipairs(nqsjwv) do
			if not qztmka:HasType(vtyxum.Type) then
				continue
			end

			return `<font color="#{vtyxum.Color:ToHex()}">{qztmka.Content}</font>`
		end
	end)
end

function Vjerna.new(ylrxjf: string, ybdumk: {string})
	local bqetwl = setmetatable({
		Content = ylrxjf,
		Types = ybdumk,
	}, Vjerna)

	return bqetwl
end

function Vjerna:AddType(rdovcn: string)
	if self:HasType(rdovcn) then
		return
	end

	table.insert(self.Types, rdovcn)
end

function Vjerna:HasType(rdovcn: string)
	return table.find(self.Types, rdovcn) ~= nil
end

return Wpzyrq
