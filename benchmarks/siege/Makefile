PORTNAME=	siege
PORTVERSION=	4.1.6
CATEGORIES=	benchmarks www
MASTER_SITES=	http://download.joedog.org/siege/ \
		http://fossies.org/linux/www/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP regression testing and benchmarking utility
WWW=		https://www.joedog.org/JoeDog/Sieg

LICENSE=	gpl2

USES=		autoreconf libtool perl5 ssl
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	PERL="${PERL}"
CONFIGURE_ARGS=	--with-ssl=${OPENSSLBASE} --disable-shared \
		--sysconfdir=${ETCDIR}

pre-configure:
	@${RM} ${WRKSRC}/acinclude.m4
	@${RM} ${WRKSRC}/utils/missing

.include <bsd.port.mk>
