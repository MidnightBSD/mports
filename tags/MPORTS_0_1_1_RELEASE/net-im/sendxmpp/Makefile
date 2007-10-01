# New ports collection makefile for:	sendxmpp
# Date created:				24 Jan 2006
# Whom:	      				Max E. Kuznecov <mek@mek.uz.ua>
#
# $MidnightBSD: mports/net-im/sendxmpp/Makefile,v 1.1 2007/05/02 23:32:45 laffer1 Exp $
# $FreeBSD: ports/net-im/sendxmpp/Makefile,v 1.1 2006/01/25 10:23:24 garga Exp $
#

PORTNAME=	sendxmpp
PORTVERSION=	0.0.8
CATEGORIES=	net-im perl5
MASTER_SITES=	http://www.djcbsoftware.nl/code/sendxmpp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl-script to send xmpp (jabber) messages

BUILD_DEPENDS=	${SITE_PERL}/Net/XMPP.pm:${PORTSDIR}/net-im/p5-Net-XMPP
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN1=	sendxmpp.1

PLIST_FILES=	bin/sendxmpp \
		%%SITE_PERL%%/mach/auto/sendxmpp/.packlist
PLIST_DIRS=	%%SITE_PERL%%/mach/auto/sendxmpp

.include <bsd.port.mk>
