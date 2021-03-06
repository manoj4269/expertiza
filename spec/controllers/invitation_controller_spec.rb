require 'rspec'

describe InvitationController do
  describe "invitation request" do
    context "when a user sends an invitation" do
      it "calls the accept_invitation method" do
        expect(accept_invitation).with(AssignmentParticipant.find(params[:student_id][:email]))
      end
    end
  end

  describe "create invitation" do
    it "should deliver an invitation email to the user" do
      invitation_attributes = FactoryGirl.attributes_for(:to, :subject, :body)
      mailer = mock(Mailer)
      mailer.should_receive(:deliver).with(accept_invitation(invitation_attributes))
    end
  end
end
