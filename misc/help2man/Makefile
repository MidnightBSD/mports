# ex:ts=8
# Ports collection makefile for:	help2man
# Date created:			Jan 30, 2002
# Whom:				ijliao
#
# $MidnightBSD: mports/misc/help2man/Makefile,v 1.4 2008/09/21 20:21:25 laffer1 Exp $
# $FreeBSD: ports/misc/help2man/Makefile,v 1.18 2006/04/30 21:54:34 arved Exp $
#

PORTNAME=	help2man
PORTVERSION=	1.39.2
CATEGORIES=	misc
MASTER_SITES=	GNU/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically generating simple manual pages from program output

LICENSE=	gpl3

CFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_PERL5=	yes

INFO=		${PORTNAME}
MAN1=		${PORTNAME}.1
PLIST_FILES=	bin/${PORTNAME}

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS=	--disable-nls
.else
BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Locale/gettext.pm:${PORTSDIR}/devel/p5-Locale-gettext
RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Locale/gettext.pm:${PORTSDIR}/devel/p5-Locale-gettext

CFLAGS+=	-lintl
MANLANG=	"" ${LANGS}
USE_GETTEXT=	yes

LANGS=		de el eo fi fr it pl pt_BR ru sv uk vi

PLIST_FILES+=	lib/bindtextdomain.so
.for lang in ${LANGS}
PLIST_FILES+=	share/locale/${lang}/LC_MESSAGES/${PORTNAME}.mo
PLIST_DIRSTRY+=	man/${lang}/man1 man/${lang}
.endfor
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^pkglibdir/ s|/${PORTNAME}$$||' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
