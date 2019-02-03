# $MidnightBSD$

PORTNAME=	apachetop
PORTVERSION=	0.12.6
PORTREVISION=	3
CATEGORIES=	sysutils
MASTER_SITES=	http://www.webta.org/apachetop/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache RealTime log stats
LICENSE=	bsd3

MAKE_JOBS_SAFE=  yes

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/apachetop man/man1/apachetop.1.gz

OPTIONS_DEFINE=	ADNS FAM PCRE
ADNS_DESC=	Asynchronous-capable DNS support

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MADNS}
LIB_DEPENDS+=	adns.1:${PORTSDIR}/dns/adns
CONFIGURE_ARGS+=--with-adns=${LOCALBASE}
.endif

.if ${PORT_OPTIONS:MFAM}
LIB_DEPENDS+=	fam.0:${PORTSDIR}/devel/fam
CONFIGURE_ARGS+=--with-fam=${LOCALBASE}
.endif

.if ${PORT_OPTIONS:MPCRE}
LIB_DEPENDS+=	pcre.3:${PORTSDIR}/devel/pcre
CONFIGURE_ARGS+=--with-pcre=${LOCALBASE}
.endif

post-patch:
	@${REINPLACE_CMD} -E -e 's,struct (circle_struct),\1,g' \
		${WRKSRC}/src/hits_circle.*
	@${REINPLACE_CMD} -E -e 's,enum (adns_queryflags),\1,g' \
		${WRKSRC}/src/log.*
	@cd ${WRKSRC} && ${TOUCH} -r configure.ac aclocal.m4 stamp-h.in

.include <bsd.port.mk>
