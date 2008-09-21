# ex:ts=8
# Ports collection makefile for:	help2man
# Date created:			Jan 30, 2002
# Whom:				ijliao
#
# $MidnightBSD: mports/misc/help2man/Makefile,v 1.3 2008/05/04 18:03:55 ctriv Exp $
# $FreeBSD: ports/misc/help2man/Makefile,v 1.18 2006/04/30 21:54:34 arved Exp $
#

PORTNAME=	help2man
PORTVERSION=	1.36.4
PORTREVISION=	2
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically generating simple manual pages from program output
LICENSE=	gpl2

.if !defined(WITHOUT_NLS)
BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Locale/gettext.pm:${PORTSDIR}/devel/p5-Locale-gettext
RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Locale/gettext.pm:${PORTSDIR}/devel/p5-Locale-gettext

MANLANG=	"" pl fr fi sv
PLIST_SUB+=	NLS=""
USE_GETTEXT=	yes
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.endif

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_PERL5=	yes

MAN1=		help2man.1
INFO=		help2man

.include <bsd.port.mk>
