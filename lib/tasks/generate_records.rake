namespace :generate_records do
  desc "Adding books to database"
  task books: :environment do
    ActiveRecord::Base.connection.execute <<-SQL
      INSERT INTO books (
        name, isbn, created_at, updated_at
      )
      SELECT
        md5(random()::text),
        left(md5(i::text), 15),
        now(),
        now()
      FROM generate_series(1, 10000000) s(i);
    SQL
  end
end
