class ChapterSubscriptionsController < ApplicationController
  def update
    @chapter_subscription = ChapterSubscription.find(params[:id])
    if @chapter_subscription.read == true
      @chapter_subscription.update(read: false)
    else
      @chapter_subscription.update(read: true)
    end
    @track = @chapter_subscription.subscription.track
    respond_to do |format|
      format.html
      format.js
    end
  end
end
