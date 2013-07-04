# $MidnightBSD: mports/misc/help2man/Makefile,v 1.10 2013/03/10 00:38:38 laffer1 Exp $

PORTNAME=	help2man
PORTVERSION=	1.41.1
PORTREVISION=	1
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

OPTIONS=	NLS	"Enable NLS"	off

.include <bsd.mport.options.mk>

.if defined(WITH_NLS)
BUILD_DEPENDS+=	p5-Locale-gettext>=0:${PORTSDIR}/devel/p5-Locale-gettext
RUN_DEPENDS+=	p5-Locale-gettext>=0:${PORTSDIR}/devel/p5-Locale-gettext

CFLAGS+=	-lintl
MANLANG=	"" ${LANGS} ${LANGS_MTREE}
USE_GETTEXT=	yes

LANGS=		de el eo fi fr hr it pl pt_BR ru sr sv uk vi
LANGS_MTREE=	ja	# languages that already exist in BSD.local.dist

PLIST_FILES+=	lib/bindtextdomain.so
.for lang in ${LANGS} ${LANGS_MTREE}
PLIST_FILES+=	share/locale/${lang}/LC_MESSAGES/${PORTNAME}.mo
.endfor
.for lang in ${LANGS}
PLIST_DIRSTRY+=	man/${lang}/man1 man/${lang}
.endfor
.else
CONFIGURE_ARGS=	--disable-nls
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^pkglibdir/ s|/${PORTNAME}$$||' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
