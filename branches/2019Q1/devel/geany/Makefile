# $MidnightBSD$
# $FreeBSD: ports/devel/geany/Makefile,v 1.10 2008/06/06 13:21:12 edwin Exp $

PORTNAME=	geany
PORTVERSION=	1.24.1
CATEGORIES=	devel editors
MASTER_SITES=	http://download.geany.org/ SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and lightweight GTK+ IDE

LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_GNOME=	gtk20 intltool
USES=		desktop-file-utils gettext-tools \
		gmake libtool pathfix pkgconfig tar:bzip2
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	VTE NLS DOCS
OPTIONS_DEFAULT=	VTE
OPTIONS_SUB=	yes

NLS_USES=	gettext-runtime
NLS_CONFIGURE_ENABLE=	nls

VTE_DESC=	Embedded virtual terminal
VTE_CONFIGURE_ENABLE=	vte
VTE_USE=	GNOME=vte

.include <bsd.mport.options.mk>

post-patch:
.if !${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} -e '/^SUBDIRS/ s|doc||' ${WRKSRC}/Makefile.in
.endif
.if !${PORT_OPTIONS:MNLS}
	@${REINPLACE_CMD} -e '/^SUBDIRS/ s|po||' ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
