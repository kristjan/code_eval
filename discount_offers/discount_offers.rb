#!/usr/bin/env ruby

class String
  VOWELS = %w[a e i o u y]
  CONSONANTS = ('a'..'z').to_a - VOWELS

  def consonant?
    length == 1 && CONSONANTS.include?(self.downcase)
  end

  def vowel?
    length == 1 && VOWELS.include?(self.downcase)
  end
end

class Recommender
  def initialize(customers, products)
    @customers = customers
    @products = products
  end

  def all_pairings
    bigger, smaller = @products.size >= @customers.size ?
      [@products, @customers] : [@customers, @products]
    sets = bigger.permutation.map do |permutation|
      smaller.first(permutation.size).zip(permutation)
    end
    sets.each{|pairs| pairs.map(&:reverse!)} if bigger == @customers
    sets
  end

  def calculate_score(customer, product)
    score = if product.length.even?
      customer.chars.select(&:vowel?).size * 1.5
    else
      customer.chars.select(&:consonant?).size
    end
    product.length.gcd(customer.length) > 1 ? score * 1.5 : score
  end

  def fill_scores
    @customers.each do |customer|
      @products.each do |product|
        score(customer, product)
      end
    end
  end

  def set_score(set)
    set.inject(0) {|total, pair| total + score(*pair)}
  end

  def scores
    @scores ||= {}
  end

  def score(customer, product)
    scores[[customer, product]] ||= calculate_score(customer, product)
  end
end

def best_offer_score(customers, products)
  recommender = Recommender.new(customers, products)
  recommender.fill_scores
  best_set, best_score = nil, -1
  recommender.all_pairings.each do |set|
    score = recommender.set_score(set)
    best_set, best_score = set, score if score > best_score
  end
  best_score
end

File.readlines(ARGV[0]).each do |line|
  customers, products = line.strip.split(';').map{|l| l.split(',')}
  puts '%.2f' % best_offer_score(customers, products)
end
