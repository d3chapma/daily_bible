class Reading < ApplicationRecord
  belongs_to :plan

  def self.create_for(plan, chapter:)
    create(plan: plan, book_name: plan.book_name, chapter: chapter)
  end

  def text
    passage = fetch_passage
    passage["search"]["result"]["passages"]["passage"]["text"]
  end

  def title
    "#{book_name} Chapter #{chapter}"
  end

  def copyright
    passage = fetch_passage
    passage["search"]["result"]["passages"]["passage"]["copyright"]
  end

  def mark_complete
    update!(completed_at: DateTime.now)
  end

  def book
    Book.get(book_name)
  end

  def completed?
    completed_at.present?
  end

  def mark_as_sent
    now = DateTime.now
    attrs = { last_sent_at: now }
    attrs.merge!({ first_sent_at: now }) unless sent?

    update(attrs)
  end

  def sent?
    last_sent_at.present?
  end

  private

  def fetch_passage
    reading = "#{book_name}+#{chapter}"
    @bible_api_response ||= BibleApi.fetch("https://bibles.org/v2/passages.xml?q[]=#{reading}&version=eng-GNTD")
  end
end
