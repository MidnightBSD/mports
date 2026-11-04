PORTNAME=	rake
PORTVERSION=	13.2.1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby Make
WWW=		https://ruby.github.io/rake/ \
		https://github.com/ruby/rake

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/MIT-LICENSE

USES=		cpe gem

NO_ARCH=	yes

PLIST_FILES=	bin/rake \
		bin/rake${RUBY_SUFFIX}

CPE_VENDOR=	ruby-lang

post-install:
	${LN} -sf ${TRUE_PREFIX}/bin/rake \
		${FAKE_DESTDIR}${TRUE_PREFIX}/bin/rake${RUBY_SUFFIX}

.include <bsd.port.mk>
