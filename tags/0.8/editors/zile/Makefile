# $FreeBSD: ports/editors/zile/Makefile,v 1.58 2008/05/16 14:10:54 miwi Exp $
# $MidnightBSD$

PORTNAME=	zile
PORTVERSION=	2.4.11
CATEGORIES=	editors
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small emacs-like text editor

LICENSE=        gpl3

LIB_DEPENDS=	libgc.so:${PORTSDIR}/devel/boehm-gc
BUILD_DEPENDS=	${LOCALBASE}/bin/help2man:${PORTSDIR}/misc/help2man

USES=		gmake perl5 pkgconfig compiler:c++11-lang
USE_PERL5=	build
USE_PERL5_BUILD=yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-included-regex

PLIST_FILES=	bin/${PORTNAME} \
		man/man1/${PORTNAME}.1.gz \
		%%DOCSDIR%%/AUTHORS \
		%%DOCSDIR%%/FAQ \
		%%DOCSDIR%%/NEWS \
		%%DOCSDIR%%/dotzile.sample

CPPFLAGS+=	-I${LOCALBASE}/include -isystem /usr/include/gnu
LDFLAGS+=	-L${LOCALBASE}/lib -lgnuregex

post-patch:
	@${REINPLACE_CMD} -e \
		'/need_charset_alias=/s|true|false|g' ${WRKSRC}/lib/Makefile.in
	@${REINPLACE_CMD} -e \
		's|@pkgdatadir@|${DOCSDIR}|' ${WRKSRC}/doc/man-extras

.include <bsd.port.mk>
