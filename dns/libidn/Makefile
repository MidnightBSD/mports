# $MidnightBSD$

PORTNAME=	libidn
PORTVERSION=	1.28
PORTREVISION=	2
CATEGORIES=	dns
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Internationalized Domain Names command line tool

LICENSE=	gpl2 lgpl3
LICENSE_COMB=	dual

BUILD_DEPENDS+=	automake-1.14:${PORTSDIR}/devel/automake14

OPTIONS_DEFINE=	DOCS NLS

GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
USES=		iconv libtool makeinfo pathfix perl5 pkgconfig
USE_LDCONFIG=	yes
USE_PERL5=	build

INFO=		libidn

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^Libs.private:/s/$$/ @LTLIBINTL@/' \
		${WRKSRC}/libidn.pc.in

post-install:
	${MKDIR} ${DOCSDIR}
.for i in FAQ NEWS README
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
