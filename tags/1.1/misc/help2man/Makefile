# $MidnightBSD$

PORTNAME=	help2man
PORTVERSION=	1.47.6
PORTREVISION=	0
CATEGORIES=	misc
MASTER_SITES=	GNU/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically generating simple manual pages from program output

LICENSE=	gpl3

OPTIONS_DEFINE=	NLS
OPTIONS_DEFAULT=	NLS

CFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
USES=		gmake perl5 tar:xz
USE_PERL5=	yes

INFO=		${PORTNAME}
PLIST_FILES=	bin/${PORTNAME} \
		man/man1/help2man.1.gz

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
BUILD_DEPENDS+=	p5-Locale-gettext>=0:${PORTSDIR}/devel/p5-Locale-gettext
RUN_DEPENDS+=	p5-Locale-gettext>=0:${PORTSDIR}/devel/p5-Locale-gettext

CFLAGS+=	-lintl
MANLANG=	"" ${LANGS} ${LANGS_MTREE}
USES+=		gettext

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
