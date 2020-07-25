class ChapterSubscriptionsController < ApplicationController
  def update
    @chapter_subscription = ChapterSubscription.find(params[:id])
    @track = @chapter_subscription.subscription.track
    p1 = current_user.subscriptions.find_by(track: @track).chapter_subscriptions.where(read: true).count.to_f
    p2 = @track.chapters.count.to_f
    @progress = (p1/p2*100) >= 0 ? (p1/p2*100).round : 0
    console
    if @chapter_subscription.read == true
      @chapter_subscription.update(read: false)
    else
      @chapter_subscription.update(read: true)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
