PORTNAME=	man2web
PORTVERSION=	0.88
PORTREVISION=	2
CATEGORIES=	www
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert man pages to HTML
WWW=		http://man2web.sourceforge.net/

LICENSE=	gpl2+ gfdl
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/doc/GPL

USES=		cpe
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--bindir="${PREFIX}/${CGIDIR}" \
		--sysconfdir="${PREFIX}/etc" \
		--with-manpath=/usr/share/man:${LOCALBASE}/man \
		--with-distro=freebsd --enable-lynx

PLIST_SUB=	CGIDIR="${CGIDIR}"
CGIDIR=	www/cgi-bin

post-extract:
	${CP} ${FILESDIR}/freebsd.h ${WRKSRC}/src/section_h/

# default Apache configuration disallows symlinks in cgi-bin
post-install:
	${LN} -sf ${PREFIX}/${CGIDIR}/man2web ${PREFIX}/bin/man2web

.include <bsd.port.mk>
