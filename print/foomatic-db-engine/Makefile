# $MidnightBSD$

PORTNAME=	engine
PORTVERSION=	4.0.12
PORTEPOCH=	2
CATEGORIES=	print
MASTER_SITES=	http://www.openprinting.org/download/foomatic/ \
		GOOGLE_CODE \
		LOCAL/acm/foomatic
PKGNAMEPREFIX=	foomatic-db-
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}
DIST_SUBDIR=	foomatic

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foomatic database engine

LICENSE=	gpl2

LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl

USE_PERL5=	yes
USE_GNOME=	libxml2
USES=		gmake perl5
GNU_CONFIGURE=	yes
PLIST_SUB+=	SITE_PERL=${SITE_PERL_REL}
CONFIGURE_ENV=	PERL=${PERL} LIBDIR=${PREFIX}/share/foomatic/ \
		LIB_CUPS=${LOCALBASE}/libexec/cups \
		CUPS_FILTERS=${LOCALBASE}/libexec/cups/filters \
		CUPS_BACKENDS=${LOCALBASE}/libexec/cups/backends

MAKE_JOBS_UNSAFE=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		"s,sysconfdir=/etc,sysconfdir=\'${PREFIX}/etc\',g ; \
		 s,/usr/local/etc:,${PREFIX}/etc:,g" ${WRKSRC}/configure
	@${REINPLACE_CMD} -e \
		"s,/usr/local/bin:,${PREFIX}/bin:,g" ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		"/ln -sf foo/ s,foomatic-ppdfile,$$\(BINDIR\)/foomatic-ppdfile," \
		-e "/if \[ -d/ s,LIB_CUPS,PREFIX," ${WRKSRC}/Makefile.in

post-install:
	cpdup -i0 ${FAKE_DESTDIR}/usr/lib ${PREFIX}/lib
.for file in foomatic-combo-xml foomatic-perl-data
	@${STRIP_CMD} ${PREFIX}/bin/${file}
.endfor

.include <bsd.port.mk>
