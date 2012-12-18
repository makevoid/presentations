# gist: https://gist.github.com/4192325
# Calcolare quali sono gli anni con piu' giorni festivi [ruby 2.0 Enumerable#lazy]

require 'date'

ETERNITY = Float::INFINITY

FESTE = [
  { day:  1, month:  1, name: "Capodanno" },
  { day:  6, month:  1, name: "Epifania" },
  { day: 25, month:  4, name: "Liberazione" },
  { day:  2, month:  6, name: "Festa della Repubblica" },
  { day: 15, month:  8, name: "Ferragosto" },
  { day: 11, month: 11, name: "Santi" },
  { day:  8, month: 12, name: "Immacolata" },
  { day: 25, month: 12, name: "Natale" },
  { day: 26, month: 12, name: "S.Stefano" },
]

(Date.today.year..ETERNITY).lazy.map do |year|
  first_day = Date.new year, 1, 1
  last_day  = Date.new(year+1, 1, 1)-1

  count = (first_day...last_day).lazy.count do |date|
    day = FESTE.find do |festa|
      festa[:day] == date.day && festa[:month] == date.month
    end
    day && !date.saturday? && !date.sunday?
  end
  p year if count == 9
  count
end.take(20).force

# => 2014, 2025, 2031 !! nessun giorno di festa e' sab o domenica