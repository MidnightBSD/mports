# New ports collection makefile for:   awesome
# Date created:                September 26, 2007
# Whom:                        Nikos Ntarmos <ntarmos@ceid.upatras.gr>
#
# $MidnightBSD: mports/x11-wm/awesome/Makefile,v 1.2 2008/08/19 22:15:30 laffer1 Exp $
# $FreeBSD: ports/x11-wm/awesome/Makefile,v 1.9 2008/05/26 13:13:22 garga Exp $
#

PORTNAME=	awesome
PORTVERSION=	2.3.2
CATEGORIES=	x11-wm
MASTER_SITES=	http://awesome.naquadah.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A tiling window manager initially based on a dwm code rewriting
LICENSE=	gpl2

BUILD_DEPENDS=	asciidoc:${PORTSDIR}/textproc/asciidoc \
		xmlto:${PORTSDIR}/textproc/xmlto
LIB_DEPENDS=	confuse.0:${PORTSDIR}/devel/libconfuse \
		cairo.2:${PORTSDIR}/graphics/cairo \
		freetype.9:${PORTSDIR}/print/freetype2 \
		Imlib2:${PORTSDIR}/graphics/imlib2

USE_ICONV=	yes
GNU_CONFIGURE=	yes
USE_EFL=	imlib2
USE_GNOME=	pango
USE_XORG=	x11 xft xext xinerama xt xrandr xproto

MAN1=		awesome.1 \
		awesome-client.1 \
		awesome-menu.1 \
		awesome-message.1
MAN5=		awesomerc.5
PORTDOCS=	AUTHORS LICENSE README STYLE UPGRADE
PORTEXAMPLES=	awesomerc

post-patch:
	@${REINPLACE_CMD} -e 's, "$$(DESTDIR)$$(docdir)";,;,g' \
			  -e 's,\([[:space:]]\)install-docDATA ,\1,g' \
		${WRKSRC}/Makefile.in

post-configure:
	@${REINPLACE_CMD} -E '/^awesome_(message_)?LDADD/s/$$/ -liconv/g; \
			      /^doc_DATA/s/=.*$$/=/g' \
		${WRKSRC}/Makefile

post-install:
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} "installing additional documentation to ${DOCSDIR}"
	@${MKDIR} ${DOCSDIR}
. for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
. endfor
.endif
.if !defined(NOPORTEXAMPLES)
	@${ECHO_MSG} "installing example config file to ${EXAMPLESDIR}"
	@${MKDIR} ${EXAMPLESDIR}
. for example in ${PORTEXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/${example} ${EXAMPLESDIR}
. endfor
.endif

.include <bsd.port.mk>
