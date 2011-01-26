# New ports collection makefile for:	p5-Test-Harness
# Date Created:				13 Aug 2001
# Whom:					Shell Hung <shell@shellhung.org>
#
# $FreeBSD: ports/devel/p5-Test-Harness/Makefile,v 1.25 2006/06/10 19:11:14 erwin Exp $
# $MidnightBSD: mports/devel/p5-Test-Harness/Makefile,v 1.3 2007/09/02 01:18:29 ctriv Exp $
#

PORTNAME=	Test-Harness
PORTVERSION=	3.16
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Test
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Run perl standard test scripts with statistics
LICENSE=	perl

PERL_CONFIGURE=	yes
INSTALL_TARGET=	pure_install

MAN1= prove.1 

MAN3= 	TAP::Parser::Result::Pragma.3 TAP::Parser::Iterator::Array.3 \
	App::Prove::State::Result.3 TAP::Base.3 \
	TAP::Formatter::Console::ParallelSession.3 TAP::Parser::Result.3 \
	TAP::Formatter::Console::Session.3 TAP::Parser::Scheduler::Job.3 \
	TAP::Parser::Result::YAML.3 TAP::Parser.3 TAP::Parser::IteratorFactory.3 \
	TAP::Parser::Iterator.3 TAP::Formatter::Color.3 \
	TAP::Parser::Iterator::Process.3 TAP::Parser::Grammar.3 Test::HACKING.3 \
	TAP::Formatter::File::Session.3 TAP::Formatter::Base.3 \
	TAP::Parser::Result::Bailout.3 TAP::Parser::Utils.3 \
	TAP::Parser::ResultFactory.3 TAP::Parser::Multiplexer.3 TAP::Object.3 \
	TAP::Parser::YAMLish::Writer.3 TAP::Parser::Result::Version.3 \
	TAP::Parser::Result::Unknown.3 App::Prove.3 TAP::Parser::YAMLish::Reader.3 \
	TAP::Parser::Scheduler.3 TAP::Parser::Result::Plan.3 \
	TAP::Parser::Source::Perl.3 TAP::Parser::Result::Test.3 \
	App::Prove::State::Result::Test.3 TAP::Formatter::Console.3 \
	TAP::Parser::Source.3 TAP::Parser::Result::Comment.3 \
	TAP::Parser::Iterator::Stream.3 TAP::Formatter::Session.3 \
	App::Prove::State.3 TAP::Harness.3 TAP::Formatter::File.3 \
	TAP::Parser::Aggregator.3 TAP::Parser::Scheduler::Spinner.3 \
	Test::Harness.3

post-patch:
	@${REINPLACE_CMD} -e '/INSTALLDIRS/d' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
