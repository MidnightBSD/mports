# $MidnightBSD$

PORTNAME=	bison
PORTVERSION=	2.7.1
PORTREVISION=	5
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parser generator from FSF, (mostly) compatible with Yacc

LICENSE=	gpl3

OPTIONS_DEFINE=	EXAMPLES NLS

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4
RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USES=		charsetfix makeinfo perl5 tar:xz
USE_PERL5_BUILD=yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

CONFIGURE_ARGS+=--disable-yacc

INFO=		bison

NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=	nls
OPTIONS_SUB=	yes

post-extract:
	@${RM} -f ${WRKSRC}/doc/bison.info*
	@${REINPLACE_CMD} 's/MANS = yacc.1/MANS =/' ${WRKSRC}/doc/Makefile.in

PORTEXAMPLES=	calc++

post-install:
	${MKDIR} ${EXAMPLESDIR}/calc++
	${INSTALL_DATA} ${WRKSRC}/examples/calc++/*.[chly]* \
		${EXAMPLESDIR}/calc++

.include <bsd.port.mk>
