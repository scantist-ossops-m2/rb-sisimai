require 'spec_helper'
require 'sisimai/mail/stdin'

describe Sisimai::Mail::STDIN do
  let(:mailobj) { Sisimai::Mail::STDIN.new(samples) }
  let(:mockobj) { Sisimai::Mail::STDIN.new(invalid) }

  describe 'class method' do
    describe '.new' do
      context '$stdin' do
        let(:samples) { $stdin }
        subject { mailobj }
        it 'returns Sisimai::Mail::STDIN object' do
          is_expected.to be_a Sisimai::Mail::STDIN
        end
      end

      context 'the arugment is not IO::STDIN' do
        let(:invalid) { '/etc/hosts' }
        it 'raises RuntimeError' do
          expect { mockobj }.to raise_error(RuntimeError)
        end
      end

      context 'wrong number of arguments' do
        it 'raises ArgumentError' do
          expect { Sisimai::Mail::STDIN.new(nil, nil) }.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe 'instance method' do
    let(:samples) { $stdin }
    describe '#path' do
      subject { mailobj.path }
      it 'is "<STDIN>"' do
        is_expected.to be_a String
        is_expected.to be == '<STDIN>'
      end
    end
    describe '#size' do
      subject { mailobj.size }
      it 'returns nil' do
        is_expected.to be nil
      end
    end
    describe '#handle' do
      let(:handle) { mailobj.handle }
      subject { handle }
      it 'is valid IO object' do
        is_expected.to be_a IO
        expect(handle.closed?).to be false
        expect(handle.stat.readable?).to be true
      end
    end
    describe '#offset' do
      subject { mailobj.offset }
      it 'is 0' do
        is_expected.to be_a Integer
        is_expected.to be == 0
      end
    end
  end
end

__END__
Return-Path: <MAILER-DAEMON@smtpgw.example.jp>
Received: from localhost (localhost)
	by smtpgw.example.jp (V8/cf) id r9G5FZh9018575;
	Wed, 16 Oct 2013 14:15:35 +0900
Date: Wed, 16 Oct 2013 14:15:35 +0900
From: Mail Delivery Subsystem <MAILER-DAEMON@smtpgw.example.jp>
Message-Id: <201310160515.r9G5FZh9018575@smtpgw.example.jp>
To: <kijitora@example.org>
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
	boundary="r9G5FZh9018575.1381900535/smtpgw.example.jp"
Subject: Returned mail: see transcript for details
Auto-Submitted: auto-generated (failure)

This is a MIME-encapsulated message

--r9G5FZh9018575.1381900535/smtpgw.example.jp

The original message was received at Wed, 16 Oct 2013 14:15:34 +0900
from p0000-ipbfpfx00kyoto.kyoto.example.co.jp [192.0.2.25]

   ----- The following addresses had permanent fatal errors -----
<userunknown@bouncehammer.jp>
    (reason: 550 5.1.1 <userunknown@bouncehammer.jp>... User Unknown)

   ----- Transcript of session follows -----
... while talking to mx.bouncehammer.jp.:
>>> DATA
<<< 550 5.1.1 <userunknown@bouncehammer.jp>... User Unknown
550 5.1.1 <userunknown@bouncehammer.jp>... User unknown
<<< 503 5.0.0 Need RCPT (recipient)

--r9G5FZh9018575.1381900535/smtpgw.example.jp
Content-Type: message/delivery-status

Reporting-MTA: dns; smtpgw.example.jp
Received-From-MTA: DNS; p0000-ipbfpfx00kyoto.kyoto.example.co.jp
Arrival-Date: Wed, 16 Oct 2013 14:15:34 +0900

Final-Recipient: RFC822; userunknown@bouncehammer.jp
Action: failed
Status: 5.1.1
Remote-MTA: DNS; mx.bouncehammer.jp
Diagnostic-Code: SMTP; 550 5.1.1 <userunknown@bouncehammer.jp>... User Unknown
Last-Attempt-Date: Wed, 16 Oct 2013 14:15:35 +0900

--r9G5FZh9018575.1381900535/smtpgw.example.jp
Content-Type: message/rfc822

Return-Path: <kijitora@example.org>
Received: from [192.0.2.25] (p0000-ipbfpfx00kyoto.kyoto.example.co.jp [192.0.2.25])
	(authenticated bits=0)
	by smtpgw.example.jp (V8/cf) with ESMTP id r9G5FXh9018568
	for <userunknown@bouncehammer.jp>; Wed, 16 Oct 2013 14:15:34 +0900
From: "Kijitora Cat" <kijitora@example.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
Subject: =?utf-8?B?44OQ44Km44Oz44K544Oh44O844Or44Gu44OG44K544OIKOaXpQ==?=
 =?utf-8?B?5pys6KqeKQ==?=
Date: Wed, 16 Oct 2013 14:15:35 +0900
Message-Id: <E1C50F1B-1C83-4820-BC36-AC6FBFBE8568@example.org>
To: userunknown@bouncehammer.jp
Mime-Version: 1.0 (Apple Message framework v1283)
X-Mailer: Apple Mail (2.1283)

5aSq55yJ54yr44CB6K2m5oiS44GX44Gm44Gm44KC54yr44GY44KD44KJ44GX44KS5o+644KJ44Gb
44Gw5a+E44Gj44Gm5p2l44KL44CCDQoNCg==

--r9G5FZh9018575.1381900535/smtpgw.example.jp--
