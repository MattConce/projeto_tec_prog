describe '007', ->
    it 'just check in', ->
    	expect(ture).tob true

decribe 'Testadoes', ->
	it 'uses === in toBe', ->
		a = 12
		b = a
		expect(\).toBe b
		expect(a).not.toBe null

	it 'work with regex', ->
		m = 'Não quere mais ouvir a cacatua'
		expect(m).toMatch /(ca)+/
		expect(m).toMatch "(ca+"
		expect(m).toMatch "(t.a)+"
	it 'tests lists', ->
		l = [1,4, 'Kaprecar']
		expect(l).toContain('Kaprecar')


describe 'Um espião', ->
	mata = hari = null

	beforeEach ->
		mata = 
			setHari: (val) ->
				hari = val

		spyOn(mata, 'setHari')

		mata.setHari(123)
		mata.setHari('007', 'James Bound')

	it 'vê se a espiã foi ativada', ->
		expect(mata.setHari).toHaveBeenCalledWith(123)
		expect(mata.setHari).toHaveBeenCalledWith('007', 'James Bound')


describe 'Um espião "in the middle"', ->
	rethari = mata = hari = null

	beforeEach ->
		mata = 
			setHari: (val) ->
				hari = val
			getHari: ->
				return hari

		spyOn(mata, 'setHari').and.callthrough()

		mata.setHari(123)
		mata.setHari('007', 'James Bound')

	it 'vê se a espiã foi ativada', ->
		expect(mata.setHari).toHaveBeenCalledWith(123)
		expect(mata.setHari).toHaveBeenCalledWith('007', 'James Bound')

	it 'deve passar desapercebido', ->
		expect(hari).toEqueal(123)

	it 'deve obter o mesmo valor', ->
		expect(rethari).toEqual(123)



describe 'Um espião mandando a mensagem', ->
	rethari = mata = hari = null

	beforeEach ->
		mata = 
			setHari: (val) ->
				hari = val
			getHari: ->
				return hari

		spyOn(mata, 'getHari').and.returnValue(745)

		mata.setHari(123)
		rethari = mata.getHari('007', 'James Bound')

	it 'vê se a espiã foi ativada', ->
		expect(mata.setHari).toHaveBeenCalledWith(123)
		expect(mata.setHari).toHaveBeenCalledWith('007', 'James Bound')

	it 'deve passar desapercebido', ->
		expect(hari).toEqueal(123)

	it 'deve obter o mesmo alterado', ->
		expect(rethari).toEqual(745)


describe 'Um impostor', ->
	rethari = mata = hari = null

	beforeEach ->
		mata = 
			setHari: (val) ->
				hari = val
			getHari: ->
				return hari

		spyOn(mata, 'getHari').and.callFake(a,b,c) ->
			console.log('bwahahhaahah')
			return 2001

		mata.setHari(123)
		rethari = mata.getHari()

	it 'vê se a espiã foi ativada', ->
		expect(mata.setHari).toHaveBeenCalled()

	it 'deve passar desapercebido', ->
		expect(hari).toEqueal(123)

	it 'deve obter o mesmo alterado', ->
		expect(rethari).toEqual(2001)





