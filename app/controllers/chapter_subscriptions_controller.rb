class ChapterSubscriptionsController < ApplicationController
  def update
    @chapter_subscription = ChapterSubscription.find(params[:id])
    if @chapter_subscription.read == true
      @chapter_subscription.update(read: false)
    else
      @chapter_subscription.update(read: true)
    end
  end
end
