class DummyData
  def populate
    25.times do
      User.create(:name => ["John", "Harry", "Steve", "Rachel", "Sherlock", "Frank"].sample + ' ' + ["Tucker", "Holmes", "Griffin", "Simpson", "Kennedy"].sample,
                   :password => ["abcd123", "12345", "password", "guest"].sample)
    end
    50.times do
      file = Filedatum.create(:md5sum => (0...64).map{ ('a'..'z').to_a[rand(26)] }.join,
                      :data   => (0...128).map{ ('a'..'z').to_a[rand(26)] }.join,
                      :mime_type => "text/html",
                      :user => User.get((1..25).to_a.sample))      
    end   
  end
end