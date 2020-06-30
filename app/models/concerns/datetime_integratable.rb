# frozen_string_literal: true

module DatetimeIntegratable
  extend ActiveSupport::Concern

  included do
    after_initialize :initialize_integrate_datetime
    before_validation :integrate_datetime

    def initialize_integrate_datetime
      self.class.datetime_integrate_targets.each do |attribute|
        next unless respond_to?(attribute.to_s)

        original_date = send(attribute.to_s)
        next if original_date.nil?

        [['date', '%Y/%m/%d'], ['hour', '%H'], ['minute', '%M']].each do |key, format|
          next if send("#{attribute}_#{key}").present?

          send("#{attribute}_#{key}=", original_date.strftime(format))
        end
      end
    end

    def integrate_datetime
      self.class.datetime_integrate_targets.each do |attribute|
        date = send("#{attribute}_date")
        hour = send("#{attribute}_hour")
        minute = send("#{attribute}_minute")
        if date.present? && hour.present? && minute.present?
          send("#{attribute}=", Time.zone.parse("#{date} #{hour}:#{minute}:00"))
        else
          send("#{attribute}=", nil)
        end
      end
    rescue StandardError
      nil
    end
  end

  module ClassMethods
    attr_accessor :datetime_integrate_targets

    def integrate_datetime_fields(*attributes)
      self.datetime_integrate_targets = attributes
      attributes.each do |attribute|
        send(:attr_accessor, "#{attribute}_date")
        send(:attr_accessor, "#{attribute}_hour")
        send(:attr_accessor, "#{attribute}_minute")
      end
    end
  end
  end
