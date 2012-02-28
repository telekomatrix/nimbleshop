desc "sets up local development environment"
task :setup_development => :environment do

  Rake::Task["db:migrate"].invoke
  Rake::Task["db:seed"].invoke

  sampledata = Sampledata.new
  sampledata.load_products

  PaymentMethod.load_default!

  sampledata.load_shop

  sampledata.load_price_information
  sampledata.load_category_information

  PaymentMethod.update_all(enabled: true)

  sampledata.load_shipping_methods

  sampledata.load_products_desc
  sampledata.process_pictures

end
