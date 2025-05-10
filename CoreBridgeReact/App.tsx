import React, { useEffect, useState } from 'react';
import { NativeModules, Text, View, StyleSheet } from 'react-native';

const { CoreBridge } = NativeModules;

const App = () => {
  const [message, setMessage] = useState<string>('Carregando...');

  useEffect(() => {
    const fetchHello = async () => {
      try {
        const result = await CoreBridge.hello('React Native');
        setMessage(result);
      } catch (error) {
        setMessage(`Erro: ${error}`);
      }
    };

    fetchHello();
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Mensagem da ponte nativa:</Text>
      <Text style={styles.result}>{message}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
    padding: 20,
  },
  title: {
    fontSize: 18,
    marginBottom: 10,
    fontWeight: 'bold',
  },
  result: {
    fontSize: 16,
    color: '#333',
  },
});

export default App;
