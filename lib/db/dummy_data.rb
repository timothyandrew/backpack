class DummyData
  def populate
    10.times do |i|
      User.create(:username => ["john", "harry", "steve", "rachel", "sherlock", "frank", "hannah", "peter", "victor", "jeremy"][i] + '_' + 
                               ["tucker", "holmes", "griffin", "simpson", "kennedy", "clarkson"].sample,
                  :password => ["abcd123", "12345", "password", "guest"].sample)
    end
    50.times do
      file = Filedatum.create(:md5sum => (0...64).map{ ('a'..'z').to_a[rand(26)] }.join,
                      :data   => (0...128).map{ ('a'..'z').to_a[rand(26)] }.join,
                      :mime_type => "text/html",
                      :user => User.get((1..10).to_a.sample))      
    end   
  end
end